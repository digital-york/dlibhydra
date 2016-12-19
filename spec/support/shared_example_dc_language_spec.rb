shared_examples_for 'dc_language' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
    @stubby.add_language_string
  end
  it 'will have a language' do
    expect(@stubby.language).to eq(['eng'])
  end
  # Fails as we don't have QA installed, but fails cleanly!
  # it 'will have a language string' do
  #   expect(@stubby.language_string).to eq(['English'])
  # end
  it 'will have the dc11 and dc language predicates' do
    expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/language')))
    #expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/elements/1.1/language')))
  end
end
