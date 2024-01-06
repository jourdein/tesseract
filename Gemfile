source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.4", ">= 7.0.4.2"
gem "sprockets-rails"
gem "sqlite3", "~> 1.4"
gem "puma", "~> 5.0"
gem "jbuilder"

gem 'hotwire-rails'
gem 'importmap-rails'
gem 'tailwindcss-rails'

gem "redis", "~> 4.0"
gem "sidekiq"
gem "bootsnap", require: false

# https://viewcomponent.org/guide/getting-started.html
# https://codeando.dev/posts/rails-view-components/
# https://mixandgo.com/learn/ruby-on-rails/view-component
# https://github.com/ViewComponent/view_component/issues/560#issuecomment-774529840
gem "view_component"
# https://github.com/palkan/view_component-contrib#hanging-initialize-out-to-dry
gem "view_component-contrib", "~> 0.2.2"
gem "lookbook"
gem "dry-initializer"
gem 'httparty'

group :development do
  gem 'brakeman'
  gem "rubocop"
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem "web-console"
  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri mingw x64_mingw]
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
