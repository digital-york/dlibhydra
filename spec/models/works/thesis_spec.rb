require 'spec_helper'
require 'active_fedora'
require 'hydra/works'
require 'action_view'

describe Dlibhydra::Thesis do
  let(:thesis) { FactoryGirl.build(:thesis) }
  let(:main_file) { FactoryGirl.build_stubbed(:fileset) }
  let(:other_file) { FactoryGirl.build_stubbed(:fileset) }

  it 'is a thesis' do
    expect(thesis.thesis?).to be_truthy
  end

  # Concerns
  it_behaves_like 'dc_keyword_subject'
  it_behaves_like 'dc_language'
  it_behaves_like 'dc_rights'
  it_behaves_like 'dc_abstract'
  it_behaves_like 'dc_creator'
  it_behaves_like 'add_labels'
  it_behaves_like 'thesis_metadata'
  it_behaves_like 'main_file'
  it_behaves_like 'former_identifier'
  it_behaves_like 'orcid'
  it_behaves_like 'doi'
  it_behaves_like 'department'
  it_behaves_like 'qualification'

  describe '#metadata' do
    specify { thesis.type.should include('http://purl.org/ontology/bibo/Thesis') }
  end

  describe '#predicates' do
    # none
  end

  describe '#related objects' do
    before(:each) do
      thesis.members << main_file
      thesis.members << other_file
    end

    it 'has an two members' do
      expect(thesis.members.size).to eq(2)
    end
  end
end
