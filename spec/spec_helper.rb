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
require 'active_support'
require 'active-fedora'
require 'dlibhydra'
require 'global_id/identification'

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

require 'curation_concerns'
CurationConcerns::Engine.config.autoload_paths.each { |path| $LOAD_PATH.unshift path }
cc_path = Gem.loaded_specs['curation_concerns'].full_gem_path
require cc_path + '/app/services/curation_concerns/noid.rb'
require cc_path + '/app/models/vocab/fedora_resource_status.rb'
require cc_path + '/app/models/curation_concerns/state_workflow.rb'
require cc_path + '/app/services/curation_concerns/derivative_path.rb'
require cc_path + '/app/services/curation_concerns/thumbnail_path_service.rb'
require cc_path + '/app/services/curation_concerns/indexes_thumbnails.rb'
require cc_path + '/app/indexers/curation_concerns/work_indexer.rb'
require cc_path + '/app/models/concerns/curation_concerns/with_file_sets.rb'
require cc_path + '/app/models/concerns/curation_concerns/required_metadata.rb'
require cc_path + '/app/models/curation_concerns/classify_concern.rb'
require cc_path + '/app/models/concerns/curation_concerns/nested_works.rb'
require cc_path + '/app/models/concerns/curation_concerns/naming.rb'
require cc_path + '/app/models/concerns/curation_concerns/has_representative.rb'
require cc_path + '/app/models/concerns/curation_concerns/serializers.rb'
require cc_path + '/app/models/concerns/curation_concerns/in_admin_set.rb'
require cc_path + '/app/models/concerns/curation_concerns/publishable.rb'
require cc_path + '/app/models/concerns/curation_concerns/human_readable_type.rb'
require cc_path + '/app/models/concerns/curation_concerns/permissions/readable.rb'
require cc_path + '/app/models/concerns/curation_concerns/permissions/writable.rb'
require cc_path + '/app/models/concerns/curation_concerns/permissions.rb'
require cc_path + '/app/models/concerns/curation_concerns/work_behavior.rb'
require cc_path + '/app/indexers/curation_concerns/admin_set_indexer.rb'
require cc_path + '/app/validators/has_one_title_validator.rb'
require cc_path + '/app/models/concerns/curation_concerns/admin_set_behavior.rb'
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
  end
  # Include shared examples for concerns
  Dir['./spec/support/**/*.rb'].sort.each { |f| require f }
end
