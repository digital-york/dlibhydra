require 'spec_helper'
require 'active_fedora'
require 'hydra/works'
require 'action_view'

# TODO: test concerns and validators only once; only test concept specific stuff here

describe Dlibhydra::Concept do
  let(:scheme) { FactoryGirl.build(:concept_scheme) }
  let(:concept1) { FactoryGirl.build(:concept) }
  let(:concept2) { FactoryGirl.build_stubbed(:broader_concept) }
  let(:concept3) { FactoryGirl.build_stubbed(:top_concept) }

  it 'is a concept' do
    expect(concept1.concept?).to be_truthy
  end

  # Concerns
  it_behaves_like 'skos_labels'
  it_behaves_like 'generic_authority_terms'
  it_behaves_like 'owl_same_as'
  it_behaves_like 'add_labels'
  it_behaves_like 'rdfs_see_also'

  describe '#metadata' do
    specify { concept1.definition.should eq('my definition is this') }
    specify { concept1.skos_note.should eq('notes') }
    specify { concept1.type.should include('http://www.w3.org/2004/02/skos/core#Concept') }
  end

  describe '#predicates' do
    specify { concept1.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#Concept') }
    specify { concept1.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#definition') }
    specify { concept1.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#note') }
  end

  describe '#related objects' do
    # helpful? http://stackoverflow.com/questions/2937326/populating-an-association-with-children-in-factory-girl
    it 'is related to the parent scheme' do
      expect(concept1.concept_scheme.preflabel).to eq('label')
    end

    it 'is a top concept' do
      expect(concept3.topconcept?).to be_truthy
    end

    it 'is not a top concept' do
      expect(concept1.topconcept?).to be_falsey
    end

    before(:each) do
      concept1.broader << concept2
    end

    it 'has a broader concept' do
      expect(concept1.broader.first.preflabel).to eq('broader object')
    end

    it 'has a narrower concept' do
      expect(concept2.narrower.first.preflabel).to eq('label')
    end
  end
end
