require 'spec_helper'
require 'active_fedora'
require 'hydra/works'
require 'action_view'

describe Dlibhydra::Dataset do
  let(:dataset) { FactoryGirl.build(:dataset) }
  let(:package) { FactoryGirl.build(:package) }
  let(:generic_work) { FactoryGirl.build(:generic_work) }
  let(:readme_file) { FactoryGirl.build(:readme_file) }

  it 'is a dataset' do
    expect(dataset.dataset?).to be_truthy
  end

  # Concerns
  # it_behaves_like "add_datacite_mandatory"
  # it_behaves_like "pure"
  # it_behaves_like "for_indexing"
  # it_behaves_like "simple_versions"
  it_behaves_like 'dc_access_rights'

  describe '#metadata' do
    specify { dataset.type.should include('http://www.w3.org/ns/dcat#Dataset') }
    specify { dataset.embargo_release_date.should eq(2016 - 12 - 12) }
    specify { dataset.retention_policy.should eq('10 years from last access') }
  end

  describe '#predicates' do
    # specify { thesis.resource.dump(:ttl).should include('http://purl.org/dc/terms/dateAccepted') }
  end

  describe '#related objects' do
    before(:each) do
      # TODO
      # dataset.readme << readme_file
      # aips.aips << package
    end

    it 'has a main file' do
      # expect(thesis.main).to eq([main_file_set])
    end
    it 'has an additional object' do
      # expect(thesis.members.size).to eq(2)
    end
  end
end
