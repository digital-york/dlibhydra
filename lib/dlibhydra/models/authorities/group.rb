module Dlibhydra
  class Group < ActiveFedora::Base

    include Hydra::Works::WorkBehavior,
            Dlibhydra::OwlSameAs,
            Dlibhydra::AddLabels,
            Dlibhydra::BorthwickNote,
            Dlibhydra::FoafName,
            Dlibhydra::GenericQualifier,
            Dlibhydra::HubDates,
            Dlibhydra::MadsRelatedAuthority,
            Dlibhydra::GenericAuthorityTerms,
            Dlibhydra::AssignId

    belongs_to :concept_scheme, class_name: 'Dlibhydra::ConceptScheme', predicate: ::RDF::SKOS.inScheme

    type << ::RDF::URI.new('https://schema.org/Organization')
    type << ::RDF::URI.new('http://vocab.getty.edu/ontology#GroupConcept')
    type << ::RDF::URI.new('http://purl.org/vra/Organization')

    property :group_type, predicate: Dlibhydra::Vocab::Generic.groupType, multiple: true do |index|
      index.as :stored_searchable
    end
    def group?
      true
    end
  end
end