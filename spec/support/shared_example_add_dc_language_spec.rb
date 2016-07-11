shared_examples_for "dc_language" do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str =  model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it "will have a language" do
    expect(@stubby.language).to eq(['en-GB'])
  end
  it 'will have the dc.language predicate' do
    expect(@stubby.resource.dump(:ttl).should include('http://purl.org/dc/terms/language'))
  end

end