require 'spec_helper'
require 'active_fedora'
require 'hydra/works'
require 'action_view'

describe Dlibhydra::Concept do

  let(:scheme) { FactoryGirl.build(:concept_scheme) }
  let(:concept0) { FactoryGirl.build(:concept) }
  let(:concept1) { FactoryGirl.build(:concept) }
  let(:concept2) { FactoryGirl.build(:concept, broader: [concept1], see_also: [concept0], top_concept_of: scheme, concept_scheme: scheme) }

  it 'is a concept' do
    expect(concept1.concept?).to be_truthy
  end

  it '' do
    expect(have_and_belong_to_many(:see_also)).to be_truthy
  end

  describe 'metadata' do

    specify { concept1.preflabel.should eq('label') }
    specify { concept1.altlabel.should eq(['alternative label']) }
    specify { concept1.definition.should eq('my definition is this') }
    specify { concept1.skos_note.should eq('notes') }
    specify { concept1.type.should include('http://www.w3.org/2004/02/skos/core#Concept') }
    specify { concept1.approved.should eq('true') }
    specify { concept1.same_as.to_s.should include('http://id.loc.gov/authorities/subjects/sh85061212') }
    specify { concept1.same_as.to_s.should include('info:lc/authorities/sh85061212') }
  end

  describe 'related objects' do

    it 'is related to the parent scheme' do
      expect(concept2.concept_scheme).to be_a(Dlibhydra::ConceptScheme)
    end

    it 'is a top concept' do
      expect(concept2.top_concept_of).to be_a(Dlibhydra::ConceptScheme)
    end

    it 'has a see_also' do
      expect(concept2.see_also).to eq([concept0])
    end

    it 'has a broader concept' do
      expect(concept2.broader).to eq([concept1])
    end

    it 'has a narrower concept' do
      expect(concept1.narrower).to eq([concept2])
    end

  end

  describe 'predicates' do

    specify { concept1.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#Concept') }
    specify { concept1.resource.dump(:ttl).should include('http://dlib.york.ac.uk/ontologies/generic#approved') }
    specify { concept1.resource.dump(:ttl).should include('http://www.w3.org/2002/07/owl#sameAs') }
    specify { concept1.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#altLabel') }
    specify { concept1.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#definition') }
    specify { concept1.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#note') }
    specify { concept1.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#prefLabel') }

    # specify { concept2.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#related') }
    # specify { concept2.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#topConceptOf') }
    # specify { concept2.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#inScheme') }
    # specify { concept1.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#narrower') }
    # specify { concept2.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#broader') }
  end

end
