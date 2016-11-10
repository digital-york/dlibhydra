FactoryGirl.define do
  factory :concept_scheme, class: Dlibhydra::ConceptScheme do
    preflabel 'label'
    altlabel  ['alternative label']
    description 'description'
  end

  factory :broader_concept, class: Dlibhydra::Concept do
    preflabel 'broader object'
  end

  factory :seealso_concept, class: Dlibhydra::Concept do
    preflabel 'seealso object'
  end

  factory :top_concept, class: Dlibhydra::Concept do
    association :top_concept_of, factory: :concept_scheme, strategy: :build
  end

  factory :concept, class: Dlibhydra::Concept do
    association :concept_scheme, factory: :concept_scheme, strategy: :build

    preflabel 'label'
    altlabel  ['alternative label']
    definition 'my definition is this'
    skos_note 'notes'
    approved 'true'
    rules 'nca'
    used 'true'
    same_as %w(http://id.loc.gov/authorities/subjects/sh85061212 info:lc/authorities/sh85061212)

    # after(:build, &:map_labels)
    #
    # trait :with_before_save_callback do
    #   after(:build, &:map_labels)
    # end
  end

  factory :group, class: Dlibhydra::Group do
    association :concept_scheme, factory: :concept_scheme, strategy: :build

    preflabel 'label'
    altlabel  ['alternative label']
    same_as %w(http://id.loc.gov/authorities/subjects/sh85061212 info:lc/authorities/sh85061212)
    related_authority ['related authority']
    approved 'true'
    rules 'nca'
    used 'true'
    name 'name'
    dates '1500-1550'
    qualifier 'order of the phoenix'
    note ['note']
    group_type ['group type']
  end

  factory :person, class: Dlibhydra::Person do
    association :concept_scheme, factory: :concept_scheme, strategy: :build

    preflabel 'label'
    altlabel  ['alternative label']
    given_name 'Stephen Patrick'
    family_name 'Morrissey'
    same_as %w(http://id.loc.gov/authorities/subjects/sh85061212 info:lc/authorities/sh85061212)
    related_authority ['related authority']
    approved 'true'
    rules 'nca'
    used 'true'
    dates '1500-1550'
    epithet 'epithet'
    pre_title 'pre_title'
    post_title 'post_title'
    note ['note']
    dates_of_office '1500-1510'
  end

  factory :current_org, class: Dlibhydra::CurrentOrganisation do
    preflabel 'University of York. Department of Miserabilism'
  end
  factory :current_person, class: Dlibhydra::CurrentPerson do
    preflabel 'Smith, Mark E.'
  end
  factory :simple_concept, class: Dlibhydra::Concept do
    preflabel 'miserabilism'
  end
end
