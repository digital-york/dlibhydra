shared_examples_for 'part_of' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'will have an part_of' do
    expect(@stubby.part_of).to eq(['part_of_test_id'])
  end
  it 'will have the frbr:partOf predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://vocab.org/frbr/core#/partOf')))
  end
end

