shared_examples_for 'dc_access_rights' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'will have access rights' do
    expect(@stubby.dc_access_rights).to eq('access rights')
  end
  it 'will have the dc.accessRights predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/accessRights')))
  end
end
