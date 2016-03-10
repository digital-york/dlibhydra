FactoryGirl.define do

  factory :concept, class: Dlibhydra::Concept do
    preflabel 'hello'
    altlabel ['alternative hello']
    definition 'my definition is this'
    #rdftype [add_rdf_types]
    istopconcept 'true'
    approved 'true'
    same_as ['http://id.loc.gov/authorities/subjects/sh85061212','info:lc/authorities/sh85061212']
  end

end