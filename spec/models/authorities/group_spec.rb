require 'spec_helper'

describe Dlibhydra::Group do

  let(:group) { described_class.create }
  let(:scheme) { Dlibhydra::ConceptScheme.create }

  it 'is a concept' do
    expect(group.group?).to be_truthy
  end

  # test metadata properties
  describe 'metadata' do
    before { mock(group) }
    specify { group.preflabel.should eq('hello') }
    specify { group.altlabel.should eq(['alternative hello']) }
    specify { group.definition.should eq('my definition is this') }
    specify { group.rdftype.should eq(['http://www.w3.org/2004/02/skos/core#Concept', 'http://pcdm.org/models#Object']) }
    specify { group.istopthing.should eq('true') }
    specify { group.approved.should eq('true') }
    specify { group.same_as.to_s.should include('http:') }
    specify { group.same_as.to_s.should include('info:') }
    specify { group.see_also eq([concept2]) }
  end

  # test related objects
  describe 'related objects' do
    before { mock(group) }

    it 'is related to the parent scheme' do
      expect(group.concept_scheme).to be_a(Dlibhydra::ConceptScheme)
    end

  end

  # test predicates sent to fedora
  describe 'predicates and rdf types' do
    before { mock(group) }
    specify { group.resource.dump(:ttl).should include("<> a \"http://www.w3.org/2004/02/skos/core#Concept\",\n     \"http://pcdm.org/models#Object\";") }
    specify { group.resource.dump(:ttl).should include('http://dlib.york.ac.uk/ontologies/generic#approved') }
    specify { group.resource.dump(:ttl).should include('http://dlib.york.ac.uk/ontologies/generic#isTopConcept') }
    specify { group.resource.dump(:ttl).should include('http://www.w3.org/2002/07/owl#sameAs') }
    specify { group.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#altLabel') }
    specify { group.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#definition') }
    specify { group.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#prefLabel') }
    specify { group.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#related') }
  end


  # test ids

  def mock(thing)
    thing.preflabel = 'hello'
    thing.altlabel << 'alternative hello'
    thing.definition = 'my definition is this'
    thing.rdftype << group.add_rdf_types
    thing.istopconcept = 'true'
    thing.approved = 'true'
    thing.same_as << 'http://id.loc.gov/authorities/subjects/sh85061212'
    thing.same_as << 'info:lc/authorities/sh85061212'
    thing.see_also << concept2
    thing.broader << concept2
    thing.concept_scheme = scheme
  end

end
