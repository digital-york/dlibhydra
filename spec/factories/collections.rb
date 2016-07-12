FactoryGirl.define do

  factory :collection, class: Dlibhydra::Collection do
    description 'description'
    creator ['Moody, Louise']
    date ['2016-01-01']
    language ['en-GB']
    subject ['philosophy']
    keyword ['keyword']
    rights_holder 'Louise Moody'
    license 'license'
  end

end