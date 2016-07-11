FactoryGirl.define do

  factory :concept_scheme, class: Dlibhydra::ConceptScheme do
    preflabel 'concept scheme label'
    altlabel  ['alternative label']
    description 'a description'
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

  factory :thesis, class: Dlibhydra::Thesis do

    title ['title']
    abstract 'abstract'
    author 'Moody, Louise'
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

  factory :group, class: Dlibhydra::Group do
    preflabel 'group label'
    altlabel  ['alternative group label']
    same_as ['http://id.loc.gov/authorities/subjects/sh85061212','info:lc/authorities/sh85061212']
  end

  factory :main_file_set, class: Dlibhydra::MainFileSet do

  end

  factory :generic_work, class: Dlibhydra::GenericWork do

  end

end