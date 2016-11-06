FactoryGirl.define do

  factory :generic_work, class: Dlibhydra::GenericWork do
    title ['Generic Work']
  end

  factory :dataset, class: Dlibhydra::Dataset do
    title ['Strangeways, Here We Come']
    embargo_release 2016 - 12 - 12
    retention_policy '10 years from last access'
    dc_access_rights 'access rights'
    doi ['xxx-xxx-xxx']
    restriction_note ['restriction note']
    for_indexing 'lovely stuff for indexing'
    publisher 'Rough Trade Records'
    date_available '2015'
    pure_uuid 'xxxx-xxxx-xxxx-xxxx'
    pure_creation '2002-05-30T09:00:00'
    pure_type 'pure type'
    pure_link ['pure link']
    creator ['Marr, Johnny']

  end

  factory :exam_paper, class: Dlibhydra::ExamPaper do
    creator ['Marr, Johnny']
    preflabel 'label'
    date ['2016-01-01']
    description 'description'
    qualification_level ['PhD']
    language ['en-GB']
    rights_holder ['Johnny Marr']
    rights ['https://creativecommons.org/publicdomain/mark/1.0/']
    former_id ['york:1234']
    module_code 'XXXXXX'

    after(:build, &:map_labels)

    trait :with_before_save_callback do
      after(:build, &:map_labels)
    end
  end

  factory :package, class: Dlibhydra::Package do
    aip_uuid 'aip-uuid'
    transfer_uuid 'transfer-uuid'
    sip_uuid 'sip-uuid'
    dip_uuid 'dip-uuid'
    aip_status 'aip-status'
    dip_status 'dip-status'
    aip_size 'aip-size'
    dip_size 'dip-size'
    aip_current_path 'aip-current-path'
    dip_current_path 'dip-current-path'
    aip_current_location 'aip-current-location'
    dip_current_location 'dip-current-location'
    aip_resource_uri 'aip-uri'
    dip_resource_uri 'dip-uri'
    origin_pipeline 'origin-pipeline'

    after(:build, &:add_types)

    trait :with_before_save_callback do
      after(:build, &:add_types)
    end

  end

  factory :thesis, class: Dlibhydra::Thesis do
    preflabel 'label'
    abstract 'abstract'
    creator ['Marr, Johnny']
    date_of_award '2016-01-01'
    qualification_level ['PhD']
    language ['en-GB']
    keyword ['northern misery']
    rights_holder ['Johnny Marr']
    rights ['https://creativecommons.org/publicdomain/mark/1.0/']
    former_id ['york:1234']
    doi ['xxx-xxx-xxx']
    orcid ['xxx-xxx-xxx']

    after(:build, &:map_labels)

    trait :with_before_save_callback do
      after(:build, &:map_labels)
    end

  end

end
