require 'spec_helper'
require 'active_fedora'
require 'hydra/works'
require 'action_view'

describe Dlibhydra::Package do

  let(:package) { FactoryGirl.build(:package) }


  it 'is a package' do
    expect(package.package?).to be_truthy
  end

  it_behaves_like 'archivematica'
  it_behaves_like 'simple_versions'

  describe '#metadata' do
    specify { package.type.should include('http://dlib.york.ac.uk/ontologies/generic#Package') }
  end

  describe '#predicates' do
    # none
  end

end
