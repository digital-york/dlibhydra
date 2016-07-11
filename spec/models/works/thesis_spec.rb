require 'spec_helper'
require 'active_fedora'
require 'hydra/works'
require 'action_view'

# TODO test concerns and validators only once; only test concept specific stuff here

describe Dlibhydra::Thesis do

  let(:thesis) { FactoryGirl.build(:thesis) }
  let(:main_file_set) { FactoryGirl.build(:main_file_set) }
  let(:generic_work) { FactoryGirl.build(:generic_work) }

  it 'is a thesis' do
    expect(thesis.thesis?).to be_truthy
  end

  # Concerns
  it_behaves_like "dc_keyword_subject"
  it_behaves_like "dc_language"
  it_behaves_like "dc_resource_type"
  it_behaves_like "dc_rights"
  it_behaves_like "dc_abstract"

  describe '#metadata' do
    specify { thesis.type.should include('http://purl.org/ontology/bibo/Thesis') }
    specify { thesis.abstract.should eq('abstract') }
    specify { thesis.author.should eq('Moody, Louise') }
    specify { thesis.abstract.should eq('abstract') }
    specify { thesis.advisor.should eq(['Stoneham, Tom']) }
    specify { thesis.date_of_award.should eq('2016-01-01') }
    specify { thesis.awarding_institution.should eq('University of York') }
    specify { thesis.department.should eq(['Department of Philosophy']) }
    specify { thesis.qualification_level.should eq('PhD') }
    specify { thesis.qualification_name.should eq('qualification') }

  end

  describe '#predicates' do
    specify { thesis.resource.dump(:ttl).should include('http://purl.org/dc/terms/dateAccepted') }
    specify { thesis.resource.dump(:ttl).should include('http://purl.org/dc/terms/creator') }
    specify { thesis.resource.dump(:ttl).should include('http://dlib.york.ac.uk/ontologies/uketd#qualificationlevel') }
    specify { thesis.resource.dump(:ttl).should include('http://dlib.york.ac.uk/ontologies/uketd#department') }
    specify { thesis.resource.dump(:ttl).should include('http://dlib.york.ac.uk/ontologies/uketd#advisor') }
    specify { thesis.resource.dump(:ttl).should include('http://bibframe.org/vocab/dissertationInstitution') }
    specify { thesis.resource.dump(:ttl).should include('http://vivoweb.org/ontology/core#AcademicDegree') }
  end

  describe '#related objects' do

    before(:each) do
      thesis.main << main_file_set
      thesis.members << generic_work
    end

    it 'has a main file' do
      expect(thesis.main).to eq([main_file_set])
    end
    it 'has an additional object' do
      expect(thesis.members.size).to eq(2)
    end

  end

end
