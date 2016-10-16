module Dlibhydra
  # concept scheme
  class ConceptScheme < ActiveFedora::Base
    include Hydra::Works::WorkBehavior,
            Dlibhydra::AddLabels,
            # FIXME: why is this causing an error in spec?
            #        Dlibhydra::ValidateConceptScheme,
            Dlibhydra::DcDescription,
            Dlibhydra::AssignId

    # TODO decide if this is right, ie. are we outside works model here?
    filters_association :members,
                        as: :concepts,
                        condition: :concept?
    filters_association :members,
                        as: :persons,
                        condition: :person?
    filters_association :members,
                        as: :groups,
                        condition: :group?
    filters_association :members,
                        as: :places,
                        condition: :place?

    # Use to list top concepts; only available for concepts.
    filters_association :members,
                        as: :has_top_concept,
                        condition: :topconcept?

    # Alternative is to use has_and_belongs_to_many,
    #   this would add the right predicate ::RDF::SKOS.hasTopConcept
    #   but filters is effort free.
    # has_and_belongs_to_many :has_top_concept, c
    #   lass_name: 'Dlibhydra::Concept',
    #   predicate: ::RDF::SKOS.hasTopConcept

    type << ::RDF::URI.new('http://www.w3.org/2004/02/skos/core#ConceptScheme')

    def concept_scheme?
      true
    end
  end
end
