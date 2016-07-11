shared_examples_for "add_rdfs_label" do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str =  model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym, :with_before_save_callback)
  end
  it "automatically generates rdfsLabel from preflabel" do
    expect(@stubby.rdfs_label).to eq('label')
  end
end