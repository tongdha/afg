set :application, "afg"
set :repository,  "git@github.com:tongdha/afg.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
# This may be the same as your `Web` server

set :user, 'ec2-user'
set :use_sudo, false
set :deploy_to, "/var/www/#{application}"
set :deploy_via, :remote_cache

ssh_options[:keys] = ["#{ENV['HOME']}/tongec2key.pem"]
#default_run_options[:pty] = true

set :default_environment, {
  'PATH' => "/home/ec2-user/.rvm/gems/ruby-1.9.3-p194@rails3/bin:/home/ec2-user/.rvm/gems/ruby-1.9.3-p194@global/bin:/home/ec2-user/.rvm/rubies/ruby-1.9.3-p194/bin:/home/ec2-user/.rvm/bin:/usr/lib/jvm/jre/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/aws/bin:/home/ec2-user/bin",
  'RUBY_VERSION' => 'ruby 1.9.3',
  'GEM_HOME'     => '/home/ec2-user/.rvm/gems/ruby-1.9.3-p194@rails3',
  'GEM_PATH'     => '/home/ec2-user/.rvm/gems/ruby-1.9.3-p194@rails3:/home/ec2-user/.rvm/gems/ruby-1.9.3-p194@global',
  'BUNDLE_PATH'  => '/home/ec2-user/.rvm/gems/ruby-1.9.3-p194@rails3'
}

role :web, "affiliateraise.com"                          # Your HTTP server, Apache/etc
role :app, "affiliateraise.com"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

after "deploy", "deploy:bundle_gems", "deploy:migrate"

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :bundle_gems do
    run "cd #{deploy_to}/current && bundle install --path vendor/gems"
  end
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
end
