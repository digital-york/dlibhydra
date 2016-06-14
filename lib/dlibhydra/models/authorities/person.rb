module Dlibhydra
  # this is not a RWO
  # as per discussion the other day, could say #rwo is the RWO
  class Person < ActiveFedora::Base

    include Hydra::Works::WorkBehavior,
            Dlibhydra::SameAs,
            Dlibhydra::SkosLabels,
            Dlibhydra::AddRdfsLabel,
            Dlibhydra::AddDcTitle,
            Dlibhydra::ValidateLabel,
            Dlibhydra::MadsRelatedAuthority,
            Dlibhydra::GenericAuthorityTerms
            # AssignId

    belongs_to :concept_scheme, class_name: 'Dlibhydra::ConceptScheme', predicate: ::RDF::SKOS.inScheme

    type << ::RDF::URI.new('http://schema.org/Person')
    type << ::RDF::URI.new('http://vocab.getty.edu/ontology#PersonConcept')
    type << ::RDF::URI.new('http://purl.org/vra/Person')

    # in VRA this includes family as well as individual
    # vra:hasCulture
    # vra:name
    # vra:birthDate
    # vra:deathDate

    # eg. NCA Rules 2.4
    property :family, predicate: ::RDF::Vocab::FOAF.familyName, multiple: false do |index|
      index.as :stored_searchable
    end

    # eg. NCA Rules 2.5C
    property :pre_title, predicate: Dlibhydra::Vocab::Generic.preTitle, multiple: false do |index|
      index.as :stored_searchable
    end

    # eg. NCA Rules 2.3
    property :given_name, predicate: ::RDF::FOAF.givenName, multiple: false do |index|
      index.as :stored_searchable
    end

    # eg. NCA Rules 2.5A
    property :dates, predicate: ::RDF::URI.new('http://data.archiveshub.ac.uk/def/dates'), multiple: false do |index|
      index.as :stored_searchable
    end

    # eg. NCA Rules 2.5B
    property :post_title, predicate: ::RDF::URI.new('http://data.archiveshub.ac.uk/def/title'), multiple: false do |index|
      index.as :stored_searchable
    end

    # eg. NCA Rules 2.5D
    property :epithet, predicate: ::RDF::URI.new('http://data.archiveshub.ac.uk/def/epithet'), multiple: false do |index|
      index.as :stored_searchable
    end

    property :dates_of_office, predicate: Dlibhydra::Vocab::Generic.datesOfOffice, multiple: false do |index|
      index.as :stored_searchable
    end

    property :note, predicate: Dlibhydra::Vocab::BorthwickRegisters.note, multiple: true do |index|
      index.as :stored_searchable
    end

    def person?
      true
    end
  end
end