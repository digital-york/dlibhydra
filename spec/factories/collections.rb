FactoryGirl.define do
  factory :collection, class: Dlibhydra::Collection do
    description ['description']
    creator_string ['Marr, Johnny']
    date ['2016-01-01']
    language ['eng']
    keyword ['northern misery']
    rights_holder ['Johnny Marr']
    rights ['https://creativecommons.org/publicdomain/mark/1.0/']
  end
end
