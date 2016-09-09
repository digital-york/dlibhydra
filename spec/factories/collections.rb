FactoryGirl.define do
  factory :collection, class: Dlibhydra::Collection do
    description 'description'
    creator ['Marr, Johnny']
    date ['2016-01-01']
    language ['en-GB']
    subject ['miserabilism']
    keyword ['northern misery']
    rights_holder 'Johnny Marr'
    license 'license'
  end
end
