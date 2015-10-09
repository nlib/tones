class TonesGenerator < Rails::Generators::Base

  desc "Copies migrations to your application"

  def copy_migration_files
    rake("tones:install:migrations")  
  end

  def setup_routes
    route "tone_resources" if open('config/routes.rb').grep(/tone_resources/).blank?
  end

end
