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
    same_as ['http://id.loc.gov/authorities/subjects/sh85061212','info:lc/authorities/sh85061212']

    after(:build) { |c|
      c.map_labels
    }

    trait :with_before_save_callback do
      after(:build) { |c|
        c.map_labels
      }
    end
  end

  factory :group, class: Dlibhydra::Group do
    preflabel 'label'
    altlabel  ['alternative label']
    same_as ['http://id.loc.gov/authorities/subjects/sh85061212','info:lc/authorities/sh85061212']
    related_authority ['related','authority']
    approved 'true'
    rules 'nca'
    used 'true'
    name 'name'
    dates '1500-1550'
    qualifier 'order of the phoenix'
    note ['note']
    group_type ['group type']
  end

end