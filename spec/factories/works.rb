FactoryGirl.define do

  factory :thesis, class: Dlibhydra::Thesis do
    title ['title']
    abstract 'abstract'
    creator ['Marr, Johnny']
    date_of_award '2016-01-01'
    advisor ['Smith, Mark E.']
    department ['Department of Miserabilism']
    awarding_institution 'University of York'
    qualification_level 'PhD'
    qualification_name 'qualification'
    resource_type ['resource type']
    language ['en-GB']
    subject ['philosophy']
    keyword ['keyword']
    rights_holder 'Johnny Marr'
    license 'license'
  end

end