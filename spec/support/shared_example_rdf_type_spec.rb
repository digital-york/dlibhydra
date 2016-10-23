shared_examples_for 'rdf_type' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    @model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build(@model_str.underscore.to_sym)
  end

  before(:each) do
    @stubby.rdf_type << 'http://www.w3.org/2004/02/skos/core#' + @model_str
  end
  it 'will have dates' do
    expect(@stubby.rdf_type).to eq(['http://www.w3.org/2004/02/skos/core#' + @model_str])
  end
  it 'will have the rdf type predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('<> a')))
  end
end
