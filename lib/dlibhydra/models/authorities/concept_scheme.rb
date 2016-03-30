module Dlibhydra
  class ConceptScheme < ActiveFedora::Base

    # TODO Is this really a collection?
    include Hydra::Works::CollectionBehavior,
            Dlibhydra::SkosLabels,
            Dlibhydra::DcTerms,
            Dlibhydra::ConceptSchemeBehaviour
            # Dlibhydra::AssignRdfTypes,
            # Dlibhydra::RdfType,
            #Dlibhydra::AssignId

    # TODO remove this once happy
    # is this needed now? for forms maybe?
    # has_many :concepts, class_name: 'Dlibhydra::Concept', :dependent => :destroy
    # has_many :persons, class_name: 'Dlibhydra::Person' #, :dependent => :destroy
    # has_many :places, class_name: 'Dlibhydra::Place' #, :dependent => :destroy
    # has_many :groups, class_name: 'Dlibhydra::Group' #, :dependent => :destroy

    filters_association :members, as: :concepts, condition: :concept?
    filters_association :members, as: :persons, condition: :person?
    filters_association :members, as: :groups, condition: :group?
    filters_association :members, as: :places, condition: :place?

    # TODO stop this being used to add members; only use to list top concepts
    filters_association :members, as: :topconcepts, condition: :topconcept?

    type << ::RDF::URI.new('http://www.w3.org/2004/02/skos/core#ConceptScheme')

    # TODO remove this once happy
    # optional, use for nested subject headings schemes
    # replaced by topconcepts above; might break arch1/_search
    # we are now missing the solr data and predicate but I guess it's possible to to_solr this?
    # property :topconcept, predicate: ::RDF::SKOS.hasTopConcept, multiple: true do |index|
    #   index.as :stored_searchable
    # end

    def concept_scheme?
      true
    end

  end
end
