require 'spec_helper'
require 'active_fedora'
require 'hydra/works'
require 'action_view'

# TODO: test concerns and validators only once; only test concept specific stuff here

describe Dlibhydra::Collection do
  let(:collection) { FactoryGirl.build(:collection) }
  let(:thesis) { FactoryGirl.build(:thesis) }

  it 'is a collection' do
    expect(collection.collection?).to be_truthy
  end

  # Concerns
  it_behaves_like 'dc_keyword_subject'
  it_behaves_like 'dc_language'
  it_behaves_like 'dc_rights'
  it_behaves_like 'dc_description'
  it_behaves_like 'dc_creator'
  it_behaves_like 'dc_date'

  describe '#related objects' do
    before(:each) do
      collection.members << thesis
    end

    it 'has a member' do
      expect(collection.members.size).to eq(1)
    end
  end
end
