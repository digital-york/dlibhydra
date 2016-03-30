require 'spec_helper'
require 'hydra/works'
require 'active_fedora'

describe Dlibhydra::ConceptScheme do

  let(:concept1) { Dlibhydra::Concept.create }
  let(:concept2) { Dlibhydra::Concept.create }
  let(:scheme) { described_class.create }
  let(:work) { Hydra::Works::Work.create}

  # TODO test deletion (if I delete does it delete the proxies - I don't think so) - not easy to test; also don't test the platform
  # TODO something better than my mock, eg. https://github.com/rspec/rspec-mocks or factory girl

  it 'is a concept scheme' do
    expect(scheme.concept_scheme?).to be_truthy
  end

  describe 'concept scheme metadata' do
    before(:each) do
      mock(scheme)
    end

    specify { scheme.preflabel.should eq('label') }
    specify { scheme.altlabel.should eq(['alternative label']) }
    specify { scheme.description.should eq('a description') }
    #specify { scheme.rdftype.should eq(['http://www.w3.org/2004/02/skos/core#ConceptScheme', 'http://pcdm.org/models#Object']) }

  end

  describe 'related objects' do
    before { mock(scheme) }

    it 'has a top concept' do
      expect(scheme.topconcepts).to eq([concept1])
    end

    it 'has two concepts' do
      expect(scheme.concepts).to include(concept1) and include(concept2)
      expect(scheme.concepts.to_a.size).to eq(2)
    end

    it 'cannot have a work as a member' do
      expect { scheme.members << work }.to raise_error(ActiveFedora::AssociationTypeMismatch)
    end

    it 'cannot have a work as a concept' do
      expect { scheme.concepts << work }.to raise_error(NoMethodError)
    end

  end

  describe 'test predicates and rdf types' do
    before { mock(scheme) }
    specify { scheme.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#ConceptScheme') }
    specify { scheme.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#altLabel') }
    specify { scheme.resource.dump(:ttl).should include('http://purl.org/dc/terms/description') }
    specify { scheme.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#prefLabel') }
  end

  def mock(scheme)
    scheme.preflabel = 'label'
    scheme.altlabel << 'alternative label'
    # scheme.rdftype << scheme.add_rdf_types
    scheme.description = 'a description'
    scheme.concepts << concept1
    scheme.concepts << concept2
    concept1.istopconcept = true
  end

end
