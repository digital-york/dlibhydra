shared_examples_for 'dc_publisher' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'will have publisher' do
    expect(@stubby.publisher).to eq('Rough Trade Records')
  end
  it 'will have the dcterms#publisher predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/elements/1.1/publisher')))
  end
end
