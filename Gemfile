source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.6'
# Add 5.1.2 pag 175
gem 'bootstrap-sass', '3.3.7'
#Add 6.3.1 pag 255
gem 'bcrypt-ruby', '3.1.5'
#Add 9.3.2 pag 4.3
gem 'faker', '1.8.7'
#Add 9.3.3. pag 405
gem 'will_paginate', '3.1.6'
gem 'bootstrap-will_paginate', '1.0.0'
# Use sqlite3 as the database for Active Record
    #No es compatible con Heroku, se ha cambiado a Postgresql
    #Más información en: https://devcenter.heroku.com/articles/sqlite3
gem 'sqlite3'
    #gem 'pg'

gem 'rspec-rails'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :test do
	gem 'capybara', '>=2.18.0'
	#Añadido en la pagina 284
	#gem 'factory_girl_rails', '4.9.0'
  #gem 'factory_girl', '4.9.0'
  gem 'factory_bot'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  #Añadido. explicación pagina 229
  gem 'annotate', '~> 2.7.2'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
