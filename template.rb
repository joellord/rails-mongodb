# This is a template for a Rails application that uses Mongoid as the ORM.
# It includes a basic scaffold for a Movies model. It can be used with the
# sample dataset provided on Atlas.

# def add_template_repository_to_source_path
  if __FILE__ =~ %r{\Ahttps?://}
    git_repo = "https://github.com/joellord/rails-mongodb"

    require "tmpdir"
    source_paths.unshift(tempdir = Dir.mktmpdir("jumpstart-"))
    at_exit { FileUtils.remove_entry(tempdir) }
    git clone: [
      "--quiet",
      git_repo,
      tempdir
    ].map(&:shellescape).join(" ")

    if (branch = __FILE__[%r{<<REPO_NAME>>/(.+)/template.rb}, 1])
      Dir.chdir(tempdir) { git checkout: branch }
    end
  else
    source_paths.unshift(File.dirname(__FILE__))
  end
# end

# def add_root_directory_files
  # copy_file "env", ".env"
  append_to_file ".gitignore", "\n.env*\n!.env.example"
# end

# def add_dependencies
  gem 'mongoid'
  gem 'tailwindcss-rails'

  rails_command "tailwindcss:install"
# end

# def copy_templates
  run "rm app/assets/stylesheets/application.css"

  generate(:scaffold, "movies", "title:string", "plot:text", "year:integer")

  directory "app", force: true
  directory "config", force: true
  directory "lib", force: true
  directory "test", force: true

  connection_string = ask("What is your connection string for MongoDB?")
  gsub_file "config/mongoid.yml", /<% CONNECTION_STRING %>/, connection_string
# end

# def add_templates_with_project_name

  # These templates incorporate the name of the project
  # template "app/helpers/shared_helper.rb.tt"
  # template "app/views/layouts/_header.html.erb.tt"
  # template "app/views/layouts/_social_headers.html.erb.tt"
  # template "app/views/users/mailer/confirmation_instructions.html.erb.tt"
# end

# def create_pages_controller
  # generate "controller pages home about"
  route "get 'about' => 'about#index'"
  route "root 'welcome#index'"
  route "resources :movies"

  # gsub_file "config/routes.rb", "get 'pages/home'\n", ""
  # gsub_file "config/routes.rb", "get 'pages/about'\n", ""
# end



after_bundle do
  # add code generators described below here

  # rails_command "db:create"
  # rails_command "db:migrate"
  git :init
  git add: "."
  git commit: %Q{ -m 'Initial commit' }
end