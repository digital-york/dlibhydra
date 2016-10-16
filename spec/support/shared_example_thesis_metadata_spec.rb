shared_examples_for 'thesis_metadata' do
  let(:model) { described_class } # the class that(includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  # metadata
  it 'will have an abstract' do
    expect(@stubby.abstract).to eq('abstract')
  end
  it 'will have an advisor' do
    expect(@stubby.advisor).to eq(['Smith, Mark E.'])
  end
  it 'will have a date of award' do
    expect(@stubby.date_of_award).to eq('2016-01-01')
  end
  it 'will have an awarding department' do
    expect(@stubby.awarding_institution).to eq('University of York')
  end
  it 'will have a qualification level' do
    expect(@stubby.qualification_level).to eq('PhD')
  end
  it 'will have an qualification name' do
    expect(@stubby.qualification_name).to eq('qualification')
  end

  # predicates
  it 'will have dc date availabe' do
    expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/dateAccepted')))
  end
  it 'will have uketd qualificationLevel' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/uketd#qualificationLevel')))
  end
  it 'will have uketd department' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/uketd#department')))
  end
  it 'will have uketd advisor' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/uketd#advisor')))
  end
  it 'will have bibframe dissertationInstitution' do
    expect(@stubby.resource.dump(:ttl).should(include('http://bibframe.org/vocab/dissertationInstitution')))
  end
  it 'will have vivoAcademicDegree' do
    expect(@stubby.resource.dump(:ttl).should(include('http://vivoweb.org/ontology/core#AcademicDegree')))
  end

end
