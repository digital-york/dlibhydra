$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
# order matters
require 'active_support'
require 'active_fedora'
require 'dlibhydra'

# spec/spec_helper.rb
require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: false)

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:head, "http://fedoraAdmin:fedoraAdmin@127.0.0.1:8984/rest/dev").
        with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Faraday v0.9.2'}).
        to_return(:status => 200, :body => "", :headers => {})
    stub_request(:post, "http://fedoraAdmin:fedoraAdmin@127.0.0.1:8984/rest/dev").
        with(:body => /fedora/,
             :headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'text/turtle', 'User-Agent'=>'Faraday v0.9.2'}).
        to_return(:status => 200, :body => "", :headers => {})
    stub_request(:post, "http://127.0.0.1:8983/solr/hydra-development/update?softCommit=true&wt=ruby").
        with(:body => /xml version/,
             :headers => {'Content-Type'=>'text/xml'}).
        to_return(:status => 200, :body => "", :headers => {})
    stub_request(:post, "http://fedoraAdmin:fedoraAdmin@127.0.0.1:8984/rest/dev").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'text/turtle', 'User-Agent'=>'Faraday v0.9.2'}).
        to_return(:status => 200, :body => "", :headers => {})
  end
end