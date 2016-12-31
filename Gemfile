source 'https://rubygems.org'

# because hyrax is in git, we can't load it in the gemspec
gem 'git'
gem 'hyrax', '0.0.1.alpha', github: 'projecthydra-labs/hyrax'

# Specify your gem's dependencies in dlibhydra.gemspec
gemspec

group :development, :test do
  # current hyrax seems to require rails 5.0.0.1 (etc.)
  # if you get an error when running tests, run with bundle exec:
  #   bundle exec rspec (if using rubymine or intellij this can be set in edit configurations 'bundler')
  gem 'rails', '5.0.0.1'
  gem 'activesupport', '5.0.0.1'
  gem 'actionpack', '5.0.0.1'
  gem 'activejob', '5.0.0.1'
  gem 'activemodel', '5.0.0.1'
  gem 'activerecord', '5.0.0.1'
  gem 'railties', '5.0.0.1'

  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'rspec-rails', '~> 3.0'
  gem 'webmock'
  gem 'simplecov', :require => false, :group => :test
end
