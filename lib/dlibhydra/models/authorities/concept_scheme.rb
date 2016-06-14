module Dlibhydra
  class ConceptScheme < ActiveFedora::Base

    include Hydra::Works::WorkBehavior,
            Dlibhydra::ConceptSchemeBehaviour,
            Dlibhydra::SkosLabels,
            Dlibhydra::AddRdfsLabel,
            Dlibhydra::AddDcTitle,
            Dlibhydra::ValidateLabel,
            Dlibhydra::DcTerms
            # Dlibhydra::AssignId

    # pcdm:hasMember using indirect containers; not in solr
    filters_association :members, as: :concepts, condition: :concept?
    filters_association :members, as: :persons, condition: :person?
    filters_association :members, as: :groups, condition: :group?
    filters_association :members, as: :places, condition: :place?

    # Use to list top concepts; only available for concepts
    filters_association :members, as: :has_top_concept, condition: :topconcept?
    # Alternative is to use has_and_belongs_to_many, would add the right predicate ::RDF::SKOS.hasTopConcept
    # but filters is effort free
    # has_and_belongs_to_many :has_top_concept, class_name: 'Dlibhydra::Concept', predicate: ::RDF::SKOS.hasTopConcept

    # not in solr
    type << ::RDF::URI.new('http://www.w3.org/2004/02/skos/core#ConceptScheme')

    def concept_scheme?
      true
    end

  end
end
