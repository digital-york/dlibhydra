require 'spec_helper'

describe Dlibhydra::Concept do

  let(:concept1) { described_class.create }
  let(:concept2) { described_class.create }
  let(:scheme) { Dlibhydra::ConceptScheme.create }
  let(:concept3) { described_class.create }

  it 'is a concept' do
    expect(concept1.concept?).to be_truthy
  end

  describe 'metadata' do
    before(:each) do
      mock(concept1)
    end

    # test metadata properties
    it 'has a preflabel property that is a string' do
      expect(concept1.preflabel).to eq('hello')
    end

    it 'has an altlabel property that is an array' do
      expect(concept1.altlabel).to eq(['alternative hello'])
    end

    it 'has a definition property that is a string' do
      expect(concept1.definition).to eq('my definition is this')
    end

    it 'has rdf types of skos:concept and pcdm:object' do
      expect(concept1.rdftype).to eq(['http://www.w3.org/2004/02/skos/core#Concept', 'http://pcdm.org/models#Object'])
    end

    it 'has an isTopConcept property that is a string' do
      expect(concept1.istopconcept).to eq('true')
    end

    it 'has an approved property that is a string' do
      expect(concept1.approved).to eq('true')
    end

    it 'has a sameAs property that is an URI' do
      expect(concept1.same_as.to_s).to include('http:')
    end

    it 'has a sameAs property that is an info URI' do
      expect(concept1.same_as.to_s).to include('info:')
    end

    it 'has an related property that is another concept object' do
      expect(concept1.see_also).to eq([concept2])
    end
  end

  # test related objects
  describe 'related objects' do
    before(:each) do
      mock(concept1)
    end

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
    before { mock(concept3) }
    specify { expect(concept3.resource.dump(:ttl)).to include("<> a \"http://www.w3.org/2004/02/skos/core#Concept\",\n     \"http://pcdm.org/models#Object\";") }
    specify { expect(concept3.resource.dump(:ttl)).to include('http://dlib.york.ac.uk/ontologies/generic#approved') }
    specify { expect(concept3.resource.dump(:ttl)).to include('http://dlib.york.ac.uk/ontologies/generic#isTopConcept') }
    specify { expect(concept3.resource.dump(:ttl)).to include('http://www.w3.org/2002/07/owl#sameAs') }
    specify { expect(concept3.resource.dump(:ttl)).to include('http://www.w3.org/2004/02/skos/core#altLabel') }
    specify { expect(concept3.resource.dump(:ttl)).to include('http://www.w3.org/2004/02/skos/core#definition') }
    specify { expect(concept3.resource.dump(:ttl)).to include('http://www.w3.org/2004/02/skos/core#prefLabel') }
    specify { expect(concept3.resource.dump(:ttl)).to include('http://www.w3.org/2004/02/skos/core#related') }
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
