class TonesGenerator < Rails::Generators::Base

  desc "Copies migrations to your application"

  def copy_migration_files
    rake("admin_contents:install:migrations")  
  end

end
