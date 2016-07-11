require 'spec_helper'
require 'hydra/works'
require 'active_fedora'
require 'action_view'

describe Dlibhydra::ConceptScheme do

  let(:concept1) { FactoryGirl.build(:concept) }
  let(:concept2) { FactoryGirl.build(:concept) }
  let(:scheme) { FactoryGirl.build(:concept_scheme) }
  let(:scheme1) { FactoryGirl.build(:concept_scheme) }
  let(:work) { FactoryGirl.build(:thesis)}

  it_behaves_like "skos_labels"
  it_behaves_like "dc_description"

  it 'is a concept scheme' do
    expect(scheme.concept_scheme?).to be_truthy
  end

  describe '#metadata' do
    specify { scheme.type.should include('http://www.w3.org/2004/02/skos/core#ConceptScheme') }
  end

  describe '#related objects' do
    before {
      scheme.concepts << concept1
      scheme.concepts << concept2
      concept1.top_concept_of = scheme
    }

    it 'has a top concept' do
      expect(scheme.has_top_concept.to_a.size).to eq(1)
    end

    it 'has two concepts' do
      expect(scheme.concepts.to_a.size).to eq(2)
    end

    it 'cannot have a work as a concept' do
      expect { scheme.concepts << work }.to raise_error(NoMethodError)
    end

    # TODO test concept scheme validation - this is not working

=begin
    before {
      scheme1.members << work
    }

    it 'cannot have a work as a member' do
      expect { scheme1.members }.to raise_error(ActiveFedora::AssociationTypeMismatch)
    end
=end

  end

end
