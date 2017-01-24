source "https://rubygems.org"

# Specify your gem's dependencies in prefab.gemspec
gemspec

# Dummy application
rails_version = ENV["RAILS_VERSION"] || "default"
case rails_version
when "master"
  rails = { github: "rails/rails" }
  gem 'sass-rails', '>= 5.0.6'
when "default"
  rails = ">= 5.0"
  gem 'sass-rails'
else
  rails = "~> #{rails_version}"

  if rails_version[0] == '5'
    gem 'sass-rails', '>= 5.0.6'
  else
    gem 'sass-rails'
  end
end

gem 'rails', rails
gem 'uglifier'
