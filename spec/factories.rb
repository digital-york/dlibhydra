FactoryGirl.define do

  factory :concept_scheme, class: Dlibhydra::ConceptScheme do
    preflabel 'label'
    altlabel  ['alternative label']
    description 'a description'
  end

  factory :concept, class: Dlibhydra::Concept do
    preflabel 'label'
    altlabel  ['alternative label']
    definition 'my definition is this'
    skos_note 'notes'
    approved 'true'
    same_as ['http://id.loc.gov/authorities/subjects/sh85061212','info:lc/authorities/sh85061212']

    after(:build) { |concept|
      concept.map_title
      concept.map_labels
    }

    trait :with_before_save_callback do
      after(:build) { |concept|
        concept.map_title
        concept.map_labels
      }
    end
  end

  factory :group, class: Dlibhydra::Group do
    preflabel 'group label'
    altlabel  ['alternative group label']
    same_as ['http://id.loc.gov/authorities/subjects/sh85061212','info:lc/authorities/sh85061212']
  end

end