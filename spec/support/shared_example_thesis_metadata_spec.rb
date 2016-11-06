shared_examples_for 'thesis_metadata' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @person = FactoryGirl.build_stubbed(:current_person)
    @org = FactoryGirl.build_stubbed(:current_org)
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)
    @stubby.advisor_resource << @person
    @stubby.awarding_institution_resource << @org
    @stubby.add_thesis_values

  end
  # metadata
  it 'will have an abstract' do
    expect(@stubby.abstract).to eq('abstract')
  end
  it 'will have an advisor' do
    expect(@stubby.advisor).to eq(['Smith, Mark E.'])
    expect(@stubby.advisor_resource.first).to eq(@person)
  end
  it 'will have a date of award' do
    expect(@stubby.date_of_award).to eq('2016-01-01')
  end
  it 'will have an awarding department' do
    expect(@stubby.awarding_institution).to eq(['University of York. Department of Miserabilism'])
    expect(@stubby.awarding_institution_resource.first).to eq(@org)
  end

  # predicates
  it 'will have dc date availabe' do
    expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/dateAccepted')))
  end
  it 'will have uketd advisor' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/uketd#advisor')))
  end
  it 'will have bibframe dissertationInstitution' do
    expect(@stubby.resource.dump(:ttl).should(include('http://bibframe.org/vocab/dissertationInstitution')))
  end

end
