require 'spec_helper'

describe Dlibhydra::Person do

  let(:person) { described_class.create }
  let(:scheme) { Dlibhydra::ConceptScheme.create }

  it 'is a concept' do
    expect(person.person?).to be_truthy
  end

  # test metadata properties
  describe 'metadata' do
    before { mock(person) }
    specify { person.preflabel.should eq('hello') }
    specify { person.altlabel.should eq(['alternative hello']) }
    specify { person.type.should eq(['http://schema.org/Person', 'http://vocab.getty.edu/ontology#PersonConcept','http://purl.org/vra/Person']) }
  end

  # test related objects
  describe 'related objects' do
    before { mock(person) }

    it 'is related to the parent scheme' do
      expect(person.concept_scheme).to be_a(Dlibhydra::ConceptScheme)
    end

  end

  # test predicates sent to fedora
  describe 'predicates and rdf types' do
    before { mock(person) }
    specify { person.resource.dump(:ttl).should include("<> a \"http://www.w3.org/2004/02/skos/core#Concept\",\n     \"http://pcdm.org/models#Object\";") }
    specify { person.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#prefLabel') }
  end


  # test ids

  def mock(thing)
    thing.preflabel = 'hello'
    thing.altlabel << 'alternative hello'
    #thing.rdftype << person.add_rdf_types
    thing.approved = 'true'
    thing.same_as << 'http://id.loc.gov/authorities/subjects/sh85061212'
    thing.same_as << 'info:lc/authorities/sh85061212'
    thing.concept_scheme = scheme
    # ADD MORE STUFF HERE
  end

end
