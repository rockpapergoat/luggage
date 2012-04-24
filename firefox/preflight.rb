#!/usr/bin/env ruby


def version_compare(version_a, version_b)
  vre = /[-.]|\d+|[^-.\d]+/
  ax = version_a.scan(vre)
  bx = version_b.scan(vre)

  while (ax.length>0 && bx.length>0)
    a = ax.shift
    b = bx.shift

    if( a == b )                 then next
    elsif (a == '-' && b == '-') then next
    elsif (a == '-')             then return -1
    elsif (b == '-')             then return 1
    elsif (a == '.' && b == '.') then next
    elsif (a == '.' )            then return -1
    elsif (b == '.' )            then return 1
    elsif (a =~ /^\d+$/ && b =~ /^\d+$/) then
      if( a =~ /^0/ or b =~ /^0/ ) then
        return a.to_s.upcase <=> b.to_s.upcase
      end
      return a.to_i <=> b.to_i
    else
      return a.upcase <=> b.upcase
    end
  end
  version_a <=> version_b;
end

def get_version(app)
   if File.exists?("#{app}/Contents/Info.plist")
     vers = `/usr/bin/defaults read "#{app}"/Contents/Info CFBundleShortVersionString`.chomp
   else
     vers = 0
   end
end

# EDIT HERE
app = "/Applications/Firefox.app"
vnew = "10.0.3"
vold = get_version(app)



case version_compare(vold,vnew)
when 0
  puts "versions are equal (#{vold}). installing anyway."
  exit(0)
when -1
  puts "version #{vold} on disk is older, installing #{vnew}."
  exit(0)
when 1
  puts "version #{vold} on disk is newer. exiting"
  exit(1)
end
