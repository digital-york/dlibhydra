require 'spec_helper'

describe Dlibhydra::Concept do

  let(:concept1) { described_class.create }
  let(:concept2) { described_class.create }
  let(:scheme) { Dlibhydra::ConceptScheme.create }

  it 'is a concept' do
    expect(concept1.concept?).to be_truthy
  end

  # test metadata properties
  describe 'metadata' do
    before { mock(concept1) }
    specify { concept1.preflabel.should eq('hello') }
    specify { concept1.altlabel.should eq(['alternative hello']) }
    specify { concept1.definition.should eq('my definition is this') }
    specify { concept1.rdftype.should eq(['http://www.w3.org/2004/02/skos/core#Concept', 'http://pcdm.org/models#Object']) }
    specify { concept1.istopconcept.should eq('true') }
    specify { concept1.approved.should eq('true') }
    specify { concept1.same_as.to_s.should include('http:') }
    specify { concept1.same_as.to_s.should include('info:') }
    specify { concept1.see_also eq([concept2]) }
  end

  # test related objects
  describe 'related objects' do
    before { mock(concept1) }

    it 'is related to the parent scheme' do
      expect(concept1.concept_scheme).to be_a(Dlibhydra::ConceptScheme)
    end

    it 'has a broader concept' do
      expect(concept1.broader).to eq([concept2])
    end

    it 'has a narrower concept' do
      expect(concept2.narrower).to eq([concept1])
    end
  end

  # test predicates sent to fedora
  describe 'predicates and rdf types' do
    before { mock(concept1) }
    specify { concept1.resource.dump(:ttl).should include("<> a \"http://www.w3.org/2004/02/skos/core#Concept\",\n     \"http://pcdm.org/models#Object\";") }
    specify { concept1.resource.dump(:ttl).should include('http://dlib.york.ac.uk/ontologies/generic#approved') }
    specify { concept1.resource.dump(:ttl).should include('http://dlib.york.ac.uk/ontologies/generic#isTopConcept') }
    specify { concept1.resource.dump(:ttl).should include('http://www.w3.org/2002/07/owl#sameAs') }
    specify { concept1.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#altLabel') }
    specify { concept1.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#definition') }
    specify { concept1.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#prefLabel') }
    specify { concept1.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#related') }
  end


  # test ids

  def mock(concept)
    concept.preflabel = 'hello'
    concept.altlabel << 'alternative hello'
    concept.definition = 'my definition is this'
    concept.rdftype << concept1.add_rdf_types
    concept.istopconcept = 'true'
    concept.approved = 'true'
    concept.same_as << 'http://id.loc.gov/authorities/subjects/sh85061212'
    concept.same_as << 'info:lc/authorities/sh85061212'
    concept.see_also << concept2
    concept.broader << concept2
    concept.concept_scheme = scheme
  end

end
