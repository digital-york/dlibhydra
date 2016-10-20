FactoryGirl.define do
  factory :thesis, class: Dlibhydra::Thesis do
    preflabel 'label'
    abstract 'abstract'
    creator ['Marr, Johnny']
    date_of_award '2016-01-01'
    advisor ['Smith, Mark E.']
    department ['Department of Miserabilism']
    awarding_institution 'University of York'
    qualification_level 'PhD'
    qualification_name 'qualification'
    language ['en-GB']
    subject ['miserabilism']
    keyword ['northern misery']
    rights_holder 'Johnny Marr'
    license 'license'

    after(:build, &:map_labels)
    # after(:build, &:add_member)

    trait :with_before_save_callback do
      after(:build, &:map_labels)
      # after(:build, &:add_member)
    end

  end

  factory :dataset, class: Dlibhydra::Dataset do
    title ['Strangeways, Here We Come']
    embargo_release_date 2016 - 12 - 12
    retention_policy '10 years from last access'
    access_rights 'access rights'
  end

  factory :package, class: Dlibhydra::Package do
    title ['Package']
  end

  factory :generic_work, class: Dlibhydra::GenericWork do
    title ['Generic Work']
  end

end
