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
  end

  factory :group, class: Dlibhydra::Group do
    preflabel 'group label'
    altlabel  ['alternative group label']
    same_as ['http://id.loc.gov/authorities/subjects/sh85061212','info:lc/authorities/sh85061212']
  end

end