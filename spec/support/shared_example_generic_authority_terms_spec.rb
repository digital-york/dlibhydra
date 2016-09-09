shared_examples_for 'generic_authority_terms' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has an approved' do
    expect(@stubby.approved).to eq('true')
  end
  it 'has a used' do
    expect(@stubby.used).to eq('true')
  end
  it 'has a rules' do
    expect(@stubby.rules).to eq('nca')
  end
  it 'has dlib generic approved predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/generic#approved')))
  end
  it 'has dlib generic used predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/generic#used')))
  end
  it 'has dlib generic rules predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/generic#rules')))
  end
end
