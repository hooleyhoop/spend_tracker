source 'http://rubygems.org'

gem 'rails', '3.0.3'
gem 'mongrel', '1.2.0.pre2'
gem 'jquery-rails'
gem 'haml'
#gem 'sqlite3-ruby', :require => 'sqlite3'
gem 'mysql'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'gravatar_image_tag', '1.0.0.pre2'
gem 'will_paginate', '3.0.pre2'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'ruby-debug19'
gem 'linecache19'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:

gem "gui"

group :development do
	gem 'annotate-models', '1.0.4'
	gem 'faker'
	gem "rspec-rails", ">= 2.2.0"
end

group :test do
	#spork doesn't seem to be ready for rails 3
	#gem 'spork', '0.8.4'
	gem 'factory_girl_rails'
	gem 'webrat', '0.7.2'
	gem 'rspec', '>= 2.2.0'
end

group :development, :test do
end

gem "autotest"
