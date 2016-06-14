require 'spec_helper'
require 'hydra/works'
require 'active_fedora'
require 'action_view'

describe Dlibhydra::ConceptScheme do

  let(:concept1) { FactoryGirl.build(:concept) }
  let(:concept2) { FactoryGirl.build(:concept) }
  let(:scheme) { FactoryGirl.build(:concept_scheme) }
  let(:scheme_no_label) { FactoryGirl.build(:concept_scheme, preflabel: '') }
  let(:work) { Hydra::Works::Work.create}

  it 'is a concept scheme' do
    expect(scheme.concept_scheme?).to be_truthy
  end

  describe 'concept scheme metadata' do
    specify { scheme.preflabel.should eq('label') }
    specify { scheme.altlabel.should eq(['alternative label']) }
    specify { scheme.description.should eq('a description') }
    specify { scheme.type.should include('http://www.w3.org/2004/02/skos/core#ConceptScheme') }
  end

  before {
    scheme_no_label.save
  }
  it 'must have a preflabel' do
    expect(scheme_no_label.errors[:preflabel]).to eq(['You must provide a preflabel'])
  end

  before {
    scheme.map_labels
  }
  it 'must have an rdfs label that is the same as preflabel' do
    expect(scheme.rdfs_label).to eq('label')
  end
  it 'must have a dc title that is the same as preflabel' do
    expect(scheme.title).to eq('label')
  end

  describe 'related objects' do
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

    it 'cannot have a work as a member' do
      expect { scheme.members << work }.to raise_error(ActiveFedora::AssociationTypeMismatch)
    end

    it 'cannot have a work as a concept' do
      expect { scheme.concepts << work }.to raise_error(NoMethodError)
    end

  end

  describe 'predicates' do
    specify { scheme.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#altLabel') }
    specify { scheme.resource.dump(:ttl).should include('http://purl.org/dc/terms/description') }
    specify { scheme.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#prefLabel') }
  end

end
