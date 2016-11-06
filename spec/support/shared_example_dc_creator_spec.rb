shared_examples_for 'dc_creator' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    if model_str == 'ExamPaper'
      @creator = FactoryGirl.build_stubbed(:current_person)
    else
      @creator = FactoryGirl.build_stubbed(:current_organisation)
    end
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)
    @stubby.creator_resource << @creator
  end
  it 'will have creator' do
    expect(@stubby.creator).to eq(["Marr, Johnny"])
    expect(@stubby.creator_resource.first).to eq(@creator)
  end
  it 'will have the dc.creator predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/creator')))
    expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/elements/1.1/creator')))
  end

  it 'will have dc_creator_tesim in the solr response' do
    expect(@stubby.to_solr.should(include('creator_value_tesim')))
  end

end
