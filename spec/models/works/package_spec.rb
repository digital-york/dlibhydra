require 'spec_helper'
require 'active_fedora'
require 'hydra/works'
require 'action_view'

describe Dlibhydra::Package do

  let(:package) { FactoryGirl.build(:package) }
  let(:fs) { FactoryGirl.build_stubbed(:fileset) }
  let(:readme) { FactoryGirl.build_stubbed(:fileset) }

  it 'is a package' do
    expect(package.package?).to be_truthy
  end

  it_behaves_like 'archivematica'
  it_behaves_like 'simple_versions'
  it_behaves_like 'readme_file'

  describe '#metadata' do
    specify { package.type.should include('http://dlib.york.ac.uk/ontologies/generic#Package') }
  end

  describe '#predicates' do
    # none
  end

  describe '#related objects' do
    before(:each) do
      package.members << fs
      package.members << readme
    end

    it 'has an two members' do
      expect(package.members.size).to eq(2)
    end
  end
end
