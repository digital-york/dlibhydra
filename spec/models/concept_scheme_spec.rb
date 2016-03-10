require 'spec_helper'

describe Dlibhydra::Concept do

  let(:concept1) { described_class.create }
  let(:concept2) { described_class.create }
  let(:scheme) { Dlibhydra::ConceptScheme.create }

  it 'is a concept scheme' do
    expect(scheme.concept_scheme?).to be_truthy
  end

  # test metadata properties
  describe 'metadata' do
    before(:each) do
      mock(scheme)
    end

    specify { scheme.preflabel.should eq('hello') }
    specify { scheme.altlabel.should eq(['alternative hello']) }
    specify { scheme.description.should eq('my description is this') }
    specify { scheme.rdftype.should eq(['http://www.w3.org/2004/02/skos/core#ConceptScheme', 'http://pcdm.org/models#Object']) }

  end

  # test related objects
  describe 'related objects' do
    before { mock(scheme) }

    it 'has a top concept' do
      expect(scheme.topconcept).to eq([concept1])
    end

    it 'has concepts' do
      expect(scheme.concepts).to eq([concept1,concept2])
    end

  end

  # test predicates sent to fedora
  describe 'predicates and rdf types' do
    before { mock(scheme) }
    specify { scheme.resource.dump(:ttl).should include("<> a \"http://www.w3.org/2004/02/skos/core#ConceptScheme\",\n     \"http://pcdm.org/models#Object\";") }
    specify { scheme.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#altLabel') }
    specify { scheme.resource.dump(:ttl).should include('http://purl.org/dc/terms/description') }
    specify { scheme.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#prefLabel') }
  end


  # test ids

  def mock(scheme)
    scheme.preflabel = 'hello'
    scheme.altlabel << 'alternative hello'
    scheme.rdftype << scheme.add_rdf_types
    scheme.description = 'my description is this'
    scheme.concepts << concept1
    scheme.concepts << concept2
    scheme.topconcept << concept1
  end

end
