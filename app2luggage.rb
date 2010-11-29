#!/usr/bin/ruby
#
#   Copyright 2010 Joe Block <jpb@ApesSeekingKnowledge.net>
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
# If this breaks your system, you get to keep the parts.

require 'ftools'

require 'rubygems'
require 'trollop'

def generateMakefile()
  rawMakefile =<<"END_MAKEFILE"
#
# Package #{$installed_app}
#
# Makefile Generated by app2luggage.rb
#

include #{$opts[:luggage_path]}

TITLE=#{$opts[:package_id]}
REVERSE_DOMAIN=#{$opts[:reverse_domain]}
PAYLOAD=install-app2luggage-#{$app_name}

install-app2luggage-#{$app_name}: l_Applications #{$tarball_name}
	@sudo /usr/bin/tar xjf #{$tarball_name} -C ${WORK_D}/Applications
	@sudo chown -R root:admin "${WORK_D}/Applications/#{$installed_app}"

END_MAKEFILE
  #return rawMakefile
  if File.exist?('./Makefile') then
    # do something with it or just report it's there.
    print "There's already a makefile here. Skipping Makefile creation."
    return
  else
    File.open("Makefile", "w") do |content|
      content.write(rawMakefile)
    end
  end
end

def make_dmg
  if File.exist?("#{$app_name}.dmg")
    print "#{$app_name}.dmg already exists. Skipping dmg creation."
    return
  else
    %x(make dmg)
  end
end
  
def make_pkg
  if File.exist?("#{$app_name}.pkg")
    print "#{$app_name}.pkg already exists. Skipping pkg creation."
    return
  else
    %x(make pkg)
  end
end
    

def clean_name(name)
  # get rid of toxic spaces
  cleaned = name.gsub(' ','_')
  return cleaned
end

def bundleApplication()
  app_dir = File.dirname($opts[:application])
  # spaces are toxic.
  scratch_tarball = "#{$app_name}.#{$build_date}.tar"
  if $opts[:debug] >= 10
    puts "app_name: #{$app_name}"
    puts "app_dir: #{app_dir}"
    puts "tarball_name: #{$tarball_name}"
  end
  # check for a pre-existing tarball so we don't step on existing files
  if File.exist?("#{$app_name}.tar.bz2")
    print "#{$app_name}.tar.bz2 already exists. Skipping tarball creation."
    return
  end
  if File.exist?("#{$app_name}.tar")
    print "#{$app_name}.tar already exists. Skipping tarball creation."
    return
  end
  # Use Apple's tar so we don't get bitten by resource forks. We only care
  # because on 10.6 they started stashing compressed binaries there. Yay.
  `/usr/bin/tar cf #{scratch_tarball} -C #{app_dir} "#{File.basename($opts[:application])}"`
  `bzip2 -9v #{scratch_tarball}`
end

$opts = Trollop::options do
  version "app2luggage 0.1 (c) 2010 Joe Block"
  banner <<-EOS
Automagically wrap an Application into a tar.bz2 and spew out a Luggage-compatible Makefile.
Usage:
       app2luggage [options] --application=AppName.app

where [options] are:
EOS

  opt :application, "Application to package", :type => String
  opt :create_tarball, "Create tarball for app", :default => false
  opt :debug, "debugging options", :default => 0
  opt :luggage_path, "path to luggage.make", :type => String, :default => "/usr/local/share/luggage/luggage.make"
  opt :make_dmg, "Make the dmg after making the Makefile", :default => false
  opt :make_pkg, "Make the pkg after making the Makefile", :default => false
  opt :package_id, "Package id (no spaces!)", :type => String
  opt :package_version, "Package version (numeric!)", :type => :int
  opt :reverse_domain, "Your domain in reverse format, eg com.example.corp", :type => String
end

# Sanity check args
Trollop::die :application, "must specify an application to package" if $opts[:application] == nil
Trollop::die :application, "#{opts[:application]} must exist" unless File.exist?($opts[:application]) if $opts[:application]
Trollop::die :luggage_path, "#{opts[:luggage_path]} doesn't exist" unless File.exist?($opts[:luggage_path]) if $opts[:luggage_path]
Trollop::die :package_id, "must specify a package id" if $opts[:package_id] == nil
Trollop::die :reverse_domain, "must specify a reversed domain" if $opts[:reverse_domain] == nil

if $opts[:debug] > 0
  require 'pp'
  puts "$opts: #{pp $opts}"
end

$build_date = `date -u "+%Y-%m-%d"`.chomp
$app_name = clean_name(File.basename($opts[:application]))
$installed_app = File.basename($opts[:application])
$tarball_name = "#{$app_name}.#{$build_date}.tar.bz2"

bundleApplication() if $opts[:create_tarball]
make_dmg() if $opts[:make_dmg]
make_pkg() if $opts[:make_pkg]
#puts generateMakefile()

