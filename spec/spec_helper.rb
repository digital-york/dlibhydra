require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
# order matters
require 'active_support'
require 'active-fedora'
require 'dlibhydra'
require 'curation_concerns'
require 'hydra/works'


# spec/spec_helper.rb
require 'webmock/rspec'
require 'factory_girl_rails'

WebMock.disable_net_connect!(allow_localhost: false)

RSpec.configure do |config|
  config.before do
    FactoryGirl.factories.clear
    FactoryGirl.find_definitions
  end
  config.include FactoryGirl::Syntax::Methods
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
  config.before(:each) do
    # stub_request(:head, "http://fedoraAdmin:fedoraAdmin@127.0.0.1:8984/rest/dev").
    stub_request(:head, /.*127.0.0.1:8984*./)
      .with(headers: { 'Accept' => '*/*', 'User-Agent' => 'Faraday v0.9.2' })
      .to_return(status: 200, body: '', headers: {})
    stub_request(:get, /.*127.0.0.1:8984*./)
      .with(headers: { 'Accept' => '*/*', 'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Prefer' => 'return=representation', 'User-Agent' => 'Faraday v0.9.2' })
      .to_return(status: 200, body: '', headers: {})
    stub_request(:post, /.*127.0.0.1:8984*./)
      .with(body: /fedora/,
            headers: { 'Accept' => '*/*', 'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type' => 'text/turtle', 'User-Agent' => 'Faraday v0.9.2' })
      .to_return(status: 200, body: '', headers: {})
    stub_request(:post, 'http://127.0.0.1:8983/solr/hydra-development/update?softCommit=true&wt=ruby')
      .with(body: /xml version/,
            headers: { 'Content-Type' => 'text/xml' })
      .to_return(status: 200, body: '', headers: {})
    stub_request(:get, /.*127.0.0.1:8983*./).
        to_return(:status => 200, :body => "", :headers => {})
  end
  # Include shared examples for concerns
  Dir['./spec/support/**/*.rb'].sort.each { |f| require f }
end
