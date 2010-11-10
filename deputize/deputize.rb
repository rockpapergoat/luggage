#!/usr/bin/env ruby
# deputize.rb
# 100616, modified version of older script
# 100617, added hash methods, rescue, more accurate ou routine
# 100617, added dummy receipt writing, logging, simplified (i think) get_ou method
# 100622, edited failure output
# 100622, edited get_ou method to exit if the correct ou isn't found
# cf. http://pastie.org/pastes/1007857
# cf. http://pastie.textmate.org/private/fenl9kdmuhqxtzhmxhx9jq

def get_host
  begin
  host=%x(/usr/sbin/dsconfigad -show | /usr/bin/awk '/Computer Account/ {print $4}').chomp
  return host
rescue
  puts "this machine must not be bound to AD.\n try again."
end
end

def get_ou
  begin
  host = get_host
  dsout = %x(/usr/bin/dscl -url /Search -read /Computers/#{host}).to_a.at(8)
  dn = dsout.to_s.split(",")[1]
  ou = dn[3..-1]
  if ou.include?("Mac")
    puts "#{host} is part of the global #{ou} group, not one of the deputy groups."
    exit 1
  else
  puts %x(hostname).chomp + " is a member of the #{ou}. proceeding..."
  return ou
end
rescue
  puts %x(hostname).chomp + " isn't a member of any required OU."
end
end

def deputize(ou)
  begin
  # define a hash with the OU names mapped to deputy admin groups
  # added in the form: OU => group
  deputy_admins = {
    "patch_excl-creative" => "deputy_admin-creative",
    "patch_excl-service" => "deputy_admin-service",
    "patch_excl-service2" => "deputy_admin-service2",
    "patch_excl-accounting" => "deputy_admin-accounting",
    "patch_excl-danger" => "deputy_admin-danger",
    }
  # actually add the correct deputy group as local admin group via dsconfigad
  if deputy_admins.has_key?("#{ou}")
    %x(/usr/bin/logger -i -t OU_ADMIN_ADDER "adding group #{deputy_admins["#{ou}"]} as local admin for OU #{ou}.")
    File.open('/Library/Receipts/org.company.ou_adder', 'w') do |line|
      line.puts %x(hostname).chomp + " is in OU #{ou}. #{deputy_admins["#{ou}"]} will be set as a local admin."
    end
    %x(/usr/sbin/dsconfigad -groups #{deputy_admins["#{ou}"]})
  else
    puts %x(hostname).chomp + " is not part of this plan."
    exit 1
  end
rescue
  puts "earlier failures have led us to this."
  exit 1
end
end

deputize(get_ou)