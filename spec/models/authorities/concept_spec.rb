require 'spec_helper'
require 'active_fedora'
require 'hydra/works'
require 'action_view'

# TODO test concerns and validators only once; only test concept specific stuff here

describe Dlibhydra::Concept do

  let(:scheme) { FactoryGirl.build(:concept_scheme) }
  #let(:concept0) { FactoryGirl.build(:concept) }
  let(:concept1) { FactoryGirl.build(:concept, :with_before_save_callback) }
  #let(:concept2) { FactoryGirl.build(:concept, broader: [concept1], see_also: [concept0], top_concept_of: scheme, concept_scheme: scheme) }

  it 'is a concept' do
    expect(concept1.concept?).to be_truthy
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

  it 'should automatically generate title from preflabel' do
    concept1.title.should eq('label')
  end

  it 'should automatically generate rdfs label from preflabel' do
    concept1.rdfs_label.should eq('label')
  end

  describe 'predicates' do
    specify { concept1.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#Concept') }
    specify { concept1.resource.dump(:ttl).should include('http://dlib.york.ac.uk/ontologies/generic#approved') }
    specify { concept1.resource.dump(:ttl).should include('http://www.w3.org/2002/07/owl#sameAs') }
    specify { concept1.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#altLabel') }
    specify { concept1.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#definition') }
    specify { concept1.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#note') }
    specify { concept1.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#prefLabel') }
  end

  describe 'related objects' do
    # TODO fix these (related to assign id) associations need saving?
    # helpful? http://stackoverflow.com/questions/2937326/populating-an-association-with-children-in-factory-girl
    it 'is related to the parent scheme' do
      #expect(concept2.concept_scheme).to be_a(Dlibhydra::ConceptScheme)
    end

    it 'is a top concept' do
      #expect(concept2.topconcept?).to be_truthy
    end

    it 'is not a top concept' do
      #expect(concept1.topconcept?).to be_falsey
    end

    it 'has a see_also' do
      #expect(have_and_belong_to_many(:see_also)).to be_truthy
      #expect(concept2.see_also).to eq([concept0])
    end

    it 'has a broader concept' do
      #expect(concept2.broader).to eq([concept1])
    end

    it 'has a narrower concept' do
      #expect(concept1.narrower).to eq([concept2])
    end

  end

end
