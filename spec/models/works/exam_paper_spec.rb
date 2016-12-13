require 'spec_helper'
require 'active_fedora'
require 'hydra/works'
require 'action_view'

describe Dlibhydra::ExamPaper do
  let(:exam) { FactoryGirl.build(:exam_paper) }
  let(:main_file) { FactoryGirl.build_stubbed(:fileset) }
  let(:other_file) { FactoryGirl.build_stubbed(:fileset) }

  it 'is an exam paper' do
    expect(exam.exam_paper?).to be_truthy
  end

  # Concerns
  it_behaves_like 'dc_language'
  it_behaves_like 'dc_date'
  it_behaves_like 'dc_description'
  it_behaves_like 'dc_rights'
  it_behaves_like 'dc_creator'
  it_behaves_like 'main_file'
  it_behaves_like 'former_identifier'
  it_behaves_like 'qualification'
  it_behaves_like 'module_code'
  it_behaves_like 'collections_category'


  describe '#metadata' do
    specify { exam.type.should include('http://purl.org/spar/fabio/ExaminationPaper') }
  end

  describe '#predicates' do
    # none
  end

  describe '#related objects' do
    before(:each) do
      exam.members << main_file
      exam.members << other_file
    end

    it 'has an two members' do
      expect(exam.members.size).to eq(2)
    end
  end
end
