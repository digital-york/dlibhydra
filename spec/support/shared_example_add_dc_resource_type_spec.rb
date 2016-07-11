shared_examples_for "dc_resource_type" do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str =  model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it "will have a resource type" do
    expect(@stubby.resource_type).to eq(['resource type'])
  end
  it 'will have the dc.type predicate' do
    expect(thesis.resource.dump(:ttl).should include('http://purl.org/dc/terms/type'))
  end

end