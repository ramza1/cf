root = "/home/deployer/apps/cf/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.cf.sock"
worker_processes 2
timeout 30

before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{root}/Gemfile"
end
