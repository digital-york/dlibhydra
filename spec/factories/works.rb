FactoryGirl.define do

  factory :thesis, class: Dlibhydra::Thesis do

    title ['title']
    abstract 'abstract'
    creator ['Moody, Louise']
    date_of_award '2016-01-01'
    advisor ['Stoneham, Tom']
    department ['Department of Philosophy']
    awarding_institution 'University of York'
    qualification_level 'PhD'
    qualification_name 'qualification'
    resource_type ['resource type']
    language ['en-GB']
    subject ['philosophy']
    keyword ['keyword']
    rights_holder 'Louise Moody'
    license 'license'
  end

end