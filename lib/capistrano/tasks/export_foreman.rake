namespace :foreman do
  desc 'Export upstart scripts'
  task :export do
    on roles(:all) do |host|
      options = []
      options << '--app rokkuto'
      options << "--log #{fetch(:log_path)}"
      options << "--user #{fetch(:user)}"
      options << "--env #{fetch(:current_path)}/.env_#{fetch(:stage)}"
      options << "--procfile #{fetch(:current_path)}/Procfile.#{fetch(:stage)}"
      dst = '/etc/init/'
      within fetch(:release_path) do
        capture "sudo foreman export #{options.join(' ')} upstart #{dst}"
      end
    end
  end
end