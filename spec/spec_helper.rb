require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

# spec/spec_helper.rb
# as of webmock v2 this has to go here, after load path and before other requires
require 'webmock/rspec'
require 'factory_girl_rails'

# order matters
require 'sprockets/railtie' # NoMethodError: undefined method `assets'
# these will throw errors if not required (eg. unitialized constant)
require 'rails_autolink'
require 'action_controller'
require 'active_support'
require 'active-fedora'
require 'active_fedora/noid'
require 'dlibhydra'
require 'global_id/identification'
require 'active_record'
require 'awesome_nested_set'

require 'hydra-access-controls'
Hydra::Engine.config.autoload_paths.each { |path| $LOAD_PATH.unshift path }
hac_path = Gem.loaded_specs['hydra-access-controls'].full_gem_path
require hac_path + '/app/models/concerns/hydra/access_controls/with_access_right.rb'
require hac_path + '/app/models/concerns/hydra/with_depositor.rb'
require hac_path + '/app/vocabularies/acl.rb'
require hac_path + '/app/validators/hydra/future_date_validator.rb'
require hac_path + '/app/models/hydra/access_control.rb'
require hac_path + '/app/models/hydra/access_controls/access_control_list.rb'
require hac_path + '/app/vocabularies/hydra/acl.rb'
require hac_path + '/app/models/hydra/access_controls/embargo.rb'
require hac_path + '/app/models/hydra/access_controls/lease.rb'

require 'bundler/setup' # because hyrax is from github
require 'git' # because hyrax is from github
require 'hyrax'
Hyrax::Engine.config.autoload_paths.each { |path| $LOAD_PATH.unshift path }

# TODO change this so that we can load the whole app,
#   eg. with engine cart https://github.com/cbeer/engine_cart
cc_path = Gem.loaded_specs['hyrax'].full_gem_path
require cc_path + '/app/services/hyrax/noid.rb'
require cc_path + '/app/models/vocab/fedora_resource_status.rb'
require cc_path + '/app/services/hyrax/derivative_path.rb'
require cc_path + '/app/services/hyrax/thumbnail_path_service.rb'
require cc_path + '/app/services/hyrax/work_thumbnail_path_service.rb'
require cc_path + '/app/services/hyrax/indexes_thumbnails.rb'
require cc_path + '/app/indexers/hyrax/indexes_workflow.rb'
require cc_path + '/app/indexers/hyrax/work_indexer.rb'
require cc_path + '/app/indexers/hyrax/collection_indexer.rb'
require cc_path + '/app/models/concerns/hyrax/with_file_sets.rb'
require cc_path + '/app/models/concerns/hyrax/required_metadata.rb'
require cc_path + '/app/models/hyrax/classify_concern.rb'
require cc_path + '/app/models/concerns/hyrax/nested_works.rb'
require cc_path + '/app/models/concerns/hyrax/naming.rb'
require cc_path + '/app/models/concerns/hyrax/has_representative.rb'
require cc_path + '/app/models/concerns/hyrax/serializers.rb'
require cc_path + '/app/models/concerns/hyrax/in_admin_set.rb'
require cc_path + '/app/models/concerns/hyrax/suppressible.rb'
require cc_path + '/app/models/concerns/hyrax/human_readable_type.rb'
require cc_path + '/app/models/concerns/hyrax/permissions/readable.rb'
require cc_path + '/app/models/concerns/hyrax/permissions/writable.rb'
require cc_path + '/app/models/concerns/hyrax/permissions.rb'
require cc_path + '/app/models/concerns/hyrax/proxy_deposit.rb'
require cc_path + '/app/models/concerns/hyrax/works/featured.rb'
require cc_path + '/app/models/concerns/hyrax/works/metadata.rb'
require cc_path + '/app/models/concerns/hyrax/works/trophies.rb'
require cc_path + '/app/models/concerns/hyrax/with_events.rb'
require cc_path + '/app/models/concerns/hyrax/work_behavior.rb'
require cc_path + '/app/models/concerns/hyrax/collection_behavior.rb'
require cc_path + '/app/models/concerns/hyrax/basic_metadata.rb'
require cc_path + '/app/models/concerns/hyrax/file_set/characterization.rb'
require cc_path + '/app/models/concerns/hyrax/file_set/derivatives.rb'
require cc_path + '/app/models/concerns/hyrax/file_set/indexing.rb'
require cc_path + '/app/models/concerns/hyrax/file_set/querying.rb'
require cc_path + '/app/models/concerns/hyrax/file_set/belongs_to_works.rb'
require cc_path + '/app/services/hyrax/local_file_service.rb'
require cc_path + '/app/services/hyrax/persist_derivatives.rb'
require cc_path + '/app/services/hyrax/persist_directly_contained_output_file_service.rb'
require cc_path + '/app/models/concerns/hyrax/file_set_behavior.rb'
require cc_path + '/app/indexers/hyrax/file_set_indexer.rb'
require cc_path + '/app/indexers/hyrax/admin_set_indexer.rb'
require cc_path + '/app/validators/hyrax/has_one_title_validator.rb'
require cc_path + '/app/models/concerns/hyrax/admin_set_behavior.rb'
require cc_path + '/app/models/admin_set.rb'


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
        to_return(:status => 200, :body => '', :headers => {})
    stub_request(:head, /.*127.0.0.1:8984*./).
        with(:headers => {'Accept'=>'*/*', 'Authorization'=>/Basic .*/, 'User-Agent'=>'Faraday v0.10.1'}).
        to_return(:status => 200, :body => "", :headers => {})
    stub_request(:post, /.*127.0.0.1:8984*./).
        with(:body => /.*/,
             :headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>/Basic .*/, 'Content-Type'=>'text/turtle', 'User-Agent'=>'Faraday v0.10.1'}).
        to_return(:status => 200, :body => "", :headers => {})


  end
  # Include shared examples for concerns
  Dir['./spec/support/**/*.rb'].sort.each { |f| require f }
end
