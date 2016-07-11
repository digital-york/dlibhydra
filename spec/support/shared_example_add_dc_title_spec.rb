shared_examples_for "add_dc_title" do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str =  model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym, :with_before_save_callback, :title => 'title')
  end
  it "will have a title" do
    expect(@stubby.title).to eq('title')
  end
end