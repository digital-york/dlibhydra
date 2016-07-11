shared_examples_for "dc_description" do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str =  model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it "will have an description" do
    expect(@stubby.description).to eq('description')
  end
  it 'will have the dc.description predicate' do
    expect(@stubby.resource.dump(:ttl).should include('http://purl.org/dc/terms/description'))
  end

end