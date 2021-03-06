shared_examples_for 'mmsid' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'will have a mmsid' do
    expect(@stubby.mmsid).to eq(['ABCDEF'])
  end
  it 'will have the mmsid predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/generic#mmsid')))
  end
end
