shared_examples_for 'dc_rights' do
  let(:model) { described_class } # the class that includes the concern

  # not testing license

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'will have a rights holder' do
    expect(@stubby.rights_holder).to eq('Johnny Marr')
  end
  it 'will have a license' do
    expect(@stubby.rights).to eq('https://creativecommons.org/publicdomain/mark/1.0/')
  end
  it 'will have the dc.rightsHolder predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/rightsHolder')))
  end
  it 'will have the edm.rights predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://www.europeana.eu/schemas/edm/rights')))
  end
end
