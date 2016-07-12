require 'spec_helper'
require 'active_fedora'
require 'hydra/works'
require 'action_view'

describe Dlibhydra::MainFileSet do

  let(:main_fs) { FactoryGirl.build(:main_file_set) }
  let(:thesis) { FactoryGirl.build(:thesis) }
  let(:fs) { Hydra::Works::FileSet.create }

  it 'is a main' do
    expect(main_fs.main?).to be_truthy
  end

  describe '#related objects' do

    before {
      thesis.main << main_fs
    }

    it 'has a main' do
      expect(thesis.main).to eq([main_fs])
    end

    it 'has a member' do
      expect(thesis.members.size).to eq(1)
    end

    it 'cannot have another fileset as main' do
      expect { thesis.main << fs }.to raise_error(NoMethodError)
    end

  end

end
