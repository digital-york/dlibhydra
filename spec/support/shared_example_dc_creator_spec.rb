shared_examples_for 'dc_creator' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @person = FactoryGirl.build_stubbed(:current_person)
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)
    @stubby.creator_resource << @person
    @stubby.add_creator_label
    @stubby.indexer
    puts @stubby.to_solr
  end
  it 'will have creator' do
    expect(@stubby.creator).to eq(["Marr, Johnny", "label"])
    expect(@stubby.creator_resource.first).to eq(@person)
  end
  it 'will have the dc.creator predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/creator')))
    expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/elements/1.1/creator')))
  end

end
