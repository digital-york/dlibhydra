shared_examples_for 'main_file' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::').last
    @stubby = FactoryGirl.build(model_str.underscore.to_sym, :with_before_save_callback)
    @main = FactoryGirl.build_stubbed(:fileset)
    @stubby.hasMainFile << @main
  end

  it 'has a main file' do
    expect(@stubby.hasMainFile).to eq([@main])
  end
  # failing because stubbed objects don't save
  it 'main file is added to members' do
    expect(@stubby.members.size).to eq(1)
  end
end
