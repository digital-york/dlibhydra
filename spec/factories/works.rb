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
    resource_type ['resource type']
    language ['en-GB']
    subject ['miserabilism']
    keyword ['northern misery']
    rights_holder 'Johnny Marr'
    license 'license'

    after(:build, &:map_labels)

    trait :with_before_save_callback do
      after(:build, &:map_labels)
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

  factory :main_file, class: Dlibhydra::MainFile do
    title ['Main File']
  end

  factory :readme, class: Dlibhydra::ReadmeFile do
    title ['Readme']
  end

  factory :generic_work, class: Dlibhydra::GenericWork do
    title ['Generic Work']
  end
end
