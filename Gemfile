source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'jbuilder', '~> 2.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.5'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
group :test do
  gem 'coveralls', require: false
end

group :development, :test do
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
end

gem 'capybara', group: %i[development test]
gem 'devise'
gem 'factory_bot', group: %i[development test]
gem 'foundation-rails', '~> 5.0'
gem 'jquery-rails'
gem 'launchy', group: %i[development test]
gem 'pry-rails', group: %i[development test]
gem 'rspec-rails', group: %i[development test]
gem 'shoulda-matchers', group: %i[development test], require: false
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'valid_attribute', group: %i[development test]
gem 'webpacker', '~> 3.3'
