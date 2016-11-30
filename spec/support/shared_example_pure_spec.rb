shared_examples_for 'pure' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)
  end
  it 'will have a pure_uuid' do
    expect(@stubby.pure_uuid).to eq('xxxx-xxxx-xxxx-xxxx')
  end
  it 'will have the pure_uuid predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/pure#pureUuid')))
  end
  it 'will have a pure_creation' do
    expect(@stubby.pure_creation).to eq('2002-05-30T09:00:00')
  end
  it 'will have the pure_creation predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/pure#pureCreation')))
  end
  it 'will have a pure type' do
    expect(@stubby.pure_type).to eq(['pure type'])
  end
  it 'will have the pure type predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/pure#pureType')))
  end
  it 'will have a pure link' do
    expect(@stubby.pure_link).to eq(['pure link'])
  end
  it 'will have the pure link predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/pure#pureLink')))
  end
end
