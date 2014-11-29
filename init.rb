$LOAD_PATH.unshift(File.expand_path("../lib", __FILE__))

begin
  require ".bundle/environment"
rescue LoadError
  require "bundler/setup"
end

require 'integrity'

# Don't modify this file.
# Please use local.rb to configure your Integrity instance.

Integrity.configure do |c|
  # DataMapper database connection URI
  c.database                    = 'sqlite3:db/integrity.db'

  # Parent directory for builds, relative to Integrity root
  c.directory                   = 'builds'

  # URL to the root of Integrity installation, used in notification emails:
  c.base_url                    = 'http://ci.example.org'
  
  # Where to write the log file.
  # c.log                         = 'integrity.log'
  
  # Enable GitHub post-receive hook
  # c.github_token                = 'SECRET'
  
  # If true, build all commits. If false, only build HEAD after each push
  c.build_all                   = true
  
  # Automatically create projects for newly pushed branches
  c.auto_branch                 = false
  
  # When auto_branch is enabled, automatically delete projects when
  # their corresponding branches are deleted
  c.trim_branches               = false
  
  # Which builder to use. Please refer to the documentation for the list
  # of builders and their limitations
  c.builder                     = :threaded, 5

  # How many builds to show by default on project pages
  c.project_default_build_count = 10
  
  # How often to collect build output from running builds
  c.build_output_interval       = 5

  # Make status badge public for all projects? Otherwise, login is
  # required to see status badge for private projects.
  c.status_image_always_public  = false

  # Known notifiers:
  # AMQP Campfire Coop Email Flowdock HTTP IRC SES Shell TCP Postmark
  c.notifiers                   = %w()

  # Use https://github.com/grahamc/git-cachecow to cache repository locally
  # c.checkout_proc             = Proc.new do |runner, repo_uri, branch, sha1, target_directory|
  #   runner.run! "git scclone #{repo_uri} #{target_directory} #{sha1}"
  # end
end

local_config = File.expand_path('../local.rb', __FILE__)
if File.exist?(local_config)
  load local_config
end
