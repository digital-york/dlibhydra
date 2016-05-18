module Dlibhydra
  class Group < ActiveFedora::Base

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

    type << ::RDF::URI.new('https://schema.org/Organization')
    type << ::RDF::URI.new('http://vocab.getty.edu/ontology#GroupConcept')
    type << ::RDF::URI.new('http://purl.org/vra/Organization')

    # also vra:name
    # eg. NCA Rules 4
    property :name, predicate: ::RDF::Vocab::FOAF.name, multiple: false do |index|
      index.as :stored_searchable
    end

    # eg. NCA Rules 4.4
    property :dates, predicate: ::RDF::URI.new('http://data.archiveshub.ac.uk/def/dates'), multiple: false do |index|
      index.as :stored_searchable
    end

    # eg. NCA Rules 4.4 use for places and status/function/sphere of activity designation as needed
    property :qualifier, predicate: Dlibhydra::Vocab::Generic.qualifier, multiple: false do |index|
      index.as :stored_searchable
    end

    property :note, predicate: Dlibhydra::Vocab::BorthwickRegisters.note, multiple: true do |index|
      index.as :stored_searchable
    end

    property :group_type, predicate: Dlibhydra::Vocab::Generic.groupType, multiple: true do |index|
      index.as :stored_searchable
    end
    def group?
      true
    end
  end
end