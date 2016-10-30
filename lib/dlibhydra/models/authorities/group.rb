module Dlibhydra
  # historical group or organisation
  class Group < ActiveFedora::Base
    include Dlibhydra::OwlSameAs,
            Dlibhydra::AddLabels,
            Dlibhydra::BorthwickNote,
            Dlibhydra::FoafName,
            Dlibhydra::GenericQualifier,
            Dlibhydra::HubDates,
            Dlibhydra::MadsRelatedAuthority,
            Dlibhydra::GenericAuthorityTerms,
            CurationConcerns::Noid
    # Hydra::Works::WorkBehavior - not pcdm objects or hydra works

    belongs_to :concept_scheme,
               class_name: 'Dlibhydra::ConceptScheme',
               predicate: ::RDF::Vocab::SKOS.inScheme

    # removed ::RDF::URI.new('https://schema.org/Organization')
    # ::RDF::URI.new('http://purl.org/vra/Organization')
    type [::RDF::URI.new('http://vocab.getty.edu/ontology#GroupConcept'),
          ::RDF::Vocab::FOAF.Agent,
          ::RDF::Vocab::FOAF.Group]

    property :group_type, predicate: Dlibhydra::Vocab::Generic.groupType,
                          multiple: true do |index|
      index.as :stored_searchable
    end
    def group?
      true
    end
  end
end
