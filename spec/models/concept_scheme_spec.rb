require 'spec_helper'

describe Dlibhydra::Concept do

  let(:concept1) { described_class.create }
  let(:concept2) { described_class.create }
  let(:scheme) { Dlibhydra::ConceptScheme.create }

  it 'is a concept scheme' do
    expect(scheme.concept_scheme?).to be_truthy
  end

  describe 'metadata' do
    before(:each) do
      mock(scheme)
    end

    # test metadata properties
    it 'has a preflabel property that is a string' do
      expect(scheme.preflabel).to eq('hello')
    end

    it 'has an altlabel property that is an array' do
      expect(scheme.altlabel).to eq(['alternative hello'])
    end

    it 'has a description property that is a string' do
      expect(scheme.description).to eq('my description is this')
    end

    it 'has rdf types of skos:concept scheme and pcdm:object' do
      expect(scheme.rdftype).to eq(['http://www.w3.org/2004/02/skos/core#ConceptScheme', 'http://pcdm.org/models#Object'])
    end

  end

  # test related objects
  describe 'related objects' do
    before(:each) do
      scheme.concepts << concept1
      scheme.concepts << concept2
      scheme.topconcept << concept1
    end

    # fails
    it 'has a top concept' do
      expect(scheme.topconcept).to be_a(Dlibhydra::Concept)
    end

    it 'has concepts' do
      expect(scheme.concepts).to eq([concept1,concept2])
    end

  end

  # test predicates sent to fedora
  describe 'predicates and rdf types' do
    before { mock(scheme) }
    specify { expect(scheme.resource.dump(:ttl)).to include("<> a \"http://www.w3.org/2004/02/skos/core#ConceptScheme\",\n     \"http://pcdm.org/models#Object\";") }
    specify { expect(scheme.resource.dump(:ttl)).to include('http://www.w3.org/2004/02/skos/core#altLabel') }
    specify { expect(scheme.resource.dump(:ttl)).to include('http://purl.org/dc/terms/description') }
    specify { expect(scheme.resource.dump(:ttl)).to include('http://www.w3.org/2004/02/skos/core#prefLabel') }
  end


  # test ids

  def mock(scheme)
    scheme.preflabel = 'hello'
    scheme.altlabel << 'alternative hello'
    scheme.rdftype << scheme.add_rdf_types
    scheme.description = 'my description is this'
  end

end
