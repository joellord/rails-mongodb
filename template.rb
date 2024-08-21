# This is a template for a Rails application that uses Mongoid as the ORM.
# It includes a basic scaffold for a Movies model. It can be used with the
# sample dataset provided on Atlas.

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

gem 'mongoid'
gem 'tailwindcss-rails'

rails_command "tailwindcss:install"

generate(:scaffold, "movies", "title:string", "plot:text", "year:integer")

directory "app", force: true
directory "config", force: true
directory "lib", force: true
directory "test", force: true

route "get 'about' => 'about#index'"
route "root 'welcome#index'"
route "resources :movies"

connection_string = ask("What is your connection string for MongoDB?")
gsub_file "config/mongoid.yml", /<% CONNECTION_STRING %>/, connection_string

rails_command "tailwindcss:build"

after_bundle do
  git :init
  git add: "."
  git commit: %Q{ -m 'Initial commit' }
end