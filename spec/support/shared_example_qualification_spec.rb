shared_examples_for 'qualification' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @name = FactoryGirl.build_stubbed(:simple_concept)
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)
    @stubby.qualification_name_resource << @name

  end
  # metadata
  it 'will have a qualification name' do
    expect(@stubby.qualification_name_resource.first).to eq(@name)
  end
  it 'will have an qualification level' do
    expect(@stubby.qualification_level).to eq(['PhD'])
  end

  # predicates
  it 'will have uketd qualificationLevel' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/uketd#qualificationLevel')))
  end
  it 'will have uketd qualificationName' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/uketd#qualificationName>')))
  end

end
