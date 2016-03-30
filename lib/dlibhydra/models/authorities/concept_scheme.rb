module Dlibhydra
  class ConceptScheme < ActiveFedora::Base

    include Hydra::Works::WorkBehavior,
            Dlibhydra::ConceptSchemeBehaviour,
            Dlibhydra::SkosLabels,
            Dlibhydra::RdfsLabel,
            Dlibhydra::ValidateLabel,
            Dlibhydra::DcTerms
            # Dlibhydra::AssignId

    # pcdm:hasMember using indirect containers; not in solr
    filters_association :members, as: :concepts, condition: :concept?
    filters_association :members, as: :persons, condition: :person?
    filters_association :members, as: :groups, condition: :group?
    filters_association :members, as: :places, condition: :place?

    # TODO stop this being used to add members; only use to list top concepts
    # TODO is this right? don't we actually want ::RDF::SKOS.hasTopConcept? has_and_belongs_to_many
    filters_association :members, as: :has_top_concept, condition: :topconcept?
    # has_and_belongs_to_many :has_top_concept, class_name: 'Dlibhydra::Concept', predicate: ::RDF::SKOS.hasTopConcept #, inverse_of: ::RDF::SKOS.topConceptOf

    # not in solr
    type << ::RDF::URI.new('http://www.w3.org/2004/02/skos/core#ConceptScheme')

    def concept_scheme?
      true
    end

  end
end
