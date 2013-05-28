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

role :web, "107.20.207.230"                          # Your HTTP server, Apache/etc
role :app, "107.20.207.230"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

after "deploy", "deploy:bundle_gems"

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
