shared_examples_for "dc_keyword_subject" do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str =  model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it "will have a subject" do
    expect(@stubby.subject).to eq(['philosophy'])
  end
  it "will have a keyword" do
    expect(@stubby.keyword).to eq(['keyword'])
  end
  it 'will have the dc.subject predicate' do
    expect(thesis.resource.dump(:ttl).should include('http://purl.org/dc/terms/subject'))
  end
  it 'will have the dc11.subject predicate' do
    expect(thesis.resource.dump(:ttl).should include('http://purl.org/dc/elements/1.1/subject'))
  end

end