#source "http://rubygems.org"
source 'http://ruby.taobao.org/'

gem 'rails', '~>3.0.7'
gem 'ruby-openid', '>= 2.0.4', :require => "openid"
gem 'rack-openid'
gem 'will_paginate', :git => "http://github.com/mislav/will_paginate.git", :branch => "rails3"
gem 'bluecloth'
gem 'RedCloth', :require => "redcloth"

gem 'acts_as_list'
gem 'acts_as_state_machine'
gem 'friendly_id', '~>4.0.0.rc2'
gem "babosa", '~>0.3.9'
gem "paperclip", "~> 4.2"

group :development, :test do
  gem 'rspec-rails'
  gem 'highline'
  gem 'sqlite3-ruby', :require => "sqlite3"
  # gem 'ruby-debug19'
  gem 'autotest'
  gem 'rails3-generators'
end

group :production do
  gem 'mysql2', '~> 0.2.7'
end
