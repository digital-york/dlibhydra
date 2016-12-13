shared_examples_for 'collections_category' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'will have a collections_category' do
    expect(@stubby.collections_category).to eq(['self-renewing'])
  end
  it 'will have the collections_category predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/generic#collectionsCategory')))
  end
end
