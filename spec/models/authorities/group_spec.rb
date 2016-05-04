require 'spec_helper'
require 'active_fedora'
require 'hydra/works'
require 'action_view'

describe Dlibhydra::Group do

  let(:group) { FactoryGirl.build(:group, concept_scheme: scheme) }
  let(:scheme) { Dlibhydra::ConceptScheme.create }

  it 'is a group' do
    expect(group.group?).to be_truthy
  end

  # test metadata properties
  describe 'metadata' do
    specify { group.preflabel.should eq('group label') }
    specify { group.altlabel.should eq(['alternative group label']) }
    specify { group.type.should include('https://schema.org/Organization') }
    specify { group.type.should include('http://vocab.getty.edu/ontology#GroupConcept') }
    specify { group.type.should include('http://purl.org/vra/Organization') }
    # name
    # dates
    # qualifier
    # group type
    # note
    # approved
    # related authority
    specify { group.same_as.to_s.should include('http:') }
    specify { group.same_as.to_s.should include('info:') }
  end

  # test related objects
  describe 'related objects' do
    it 'is related to the parent scheme' do
      expect(group.concept_scheme).to be_a(Dlibhydra::ConceptScheme)
    end

  end

  # test predicates sent to fedora
  describe 'predicates' do
    specify { group.resource.dump(:ttl).should include('http://dlib.york.ac.uk/ontologies/generic#approved') }
    specify { group.resource.dump(:ttl).should include('http://www.w3.org/2002/07/owl#sameAs') }
    specify { group.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#altLabel') }
    specify { group.resource.dump(:ttl).should include('http://www.w3.org/2004/02/skos/core#prefLabel') }
    specify { group.resource.dump(:ttl).should include('') }
  end

end
