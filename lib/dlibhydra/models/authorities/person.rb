module Dlibhydra
  # person
  # this is not a RWO, could say #rwo is the RWO
  class Person < ActiveFedora::Base
    include Hydra::Works::WorkBehavior,
            Dlibhydra::OwlSameAs,
            Dlibhydra::AddLabels,
            Dlibhydra::BorthwickNote,
            Dlibhydra::FoafNameParts,
            Dlibhydra::HubDates,
            Dlibhydra::MadsRelatedAuthority,
            Dlibhydra::GenericAuthorityTerms,
            Dlibhydra::AssignId

    belongs_to :concept_scheme,
               class_name: 'Dlibhydra::ConceptScheme',
               predicate: ::RDF::SKOS.inScheme

    type << ::RDF::URI.new('http://schema.org/Person')
    type << ::RDF::URI.new('http://vocab.getty.edu/ontology#PersonConcept')
    type << ::RDF::URI.new('http://purl.org/vra/Person')

    # in VRA this includes family as well as individual (use group)
    # vra:hasCulture
    # vra:name == foaf.name
    # vra:birthDate
    # vra:deathDate

    # Eg. NCA Rules 2.5C.
    property :pre_title, predicate: Dlibhydra::Vocab::Generic.preTitle,
                         multiple: false do |index|
      index.as :stored_searchable
    end

    # Eg. NCA Rules 2.5B.
    property :post_title,
             predicate: ::RDF::URI.new('http://data.archiveshub.ac.uk/def/title'),
             multiple: false do |index|
      index.as :stored_searchable
    end

    # Eg. NCA Rules 2.5D.
    property :epithet,
             predicate: ::RDF::URI.new('http://data.archiveshub.ac.uk/def/epithet'),
             multiple: false do |index|
      index.as :stored_searchable
    end

    property :dates_of_office,
             predicate: Dlibhydra::Vocab::Generic.datesOfOffice,
             multiple: false do |index|
      index.as :stored_searchable
    end

    def person?
      true
    end
  end
end
