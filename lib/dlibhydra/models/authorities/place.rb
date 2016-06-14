module Dlibhydra
  class Place < ActiveFedora::Base

    include Hydra::Works::WorkBehavior,
            Dlibhydra::SameAs,
            Dlibhydra::SkosLabels,
            Dlibhydra::AddRdfsLabel,
            Dlibhydra::AddDcTitle,
            Dlibhydra::ValidateLabel,
            Dlibhydra::MadsRelatedAuthority
            Dlibhydra::GenericAuthorityTerms
            #, AssignId

    belongs_to :concept_scheme, predicate: ::RDF::SKOS.inScheme

    type << ::RDF::URI.new('http://schema.org/Place')
    type << ::RDF::URI.new('http://purl.org/vra/Place') # ???
    # TODO GVP CLASS AdminPlaceConcept or PhysPlaceConcept

    # TODO which are place objects and which are place strings

    has_and_belongs_to_many :contained_in_place, class_name: 'Dlibhydra::Concept', predicate: ::RDF::URI.new('https://schema.org/containedInPlace'), inverse_of: :contains_place
    has_and_belongs_to_many :contains_place, class_name: 'Dlibhydra::Concept', predicate: ::RDF::URI.new('https://schema.org/containsPlace'), inverse_of: :contained_in_place

    # TODO classes of place
    # vra subclasses of Place (feature codes in this model)
    # http://purl.org/vra/CivicStructure
    # http://purl.org/vra/Continent
    # http://purl.org/vra/AdministrativeArea subclasses http://purl.org/vra/State, http://purl.org/vra/City

    # use http://unlock.edina.ac.uk/ws/supportedFeatureTypes?&gazetteer=deep&format=json
    # TODO should be generic; TODO needs a proper vocabulary - crossover with RDF types
    property :feature_code, predicate: Dlibhydra::Vocab::BorthwickRegisters.featureType, multiple: true do |index|
      index.as :stored_searchable
    end

    # eg. NCARules name.
    property :place_name, predicate: ::RDF::URI.new('http://www.geonames.org/ontology#name'), multiple: false do |index|
      index.as :stored_searchable
    end

    # eg. NCARules civil parish.
    property :parent_ADM4, predicate: ::RDF::URI.new('http://www.geonames.org/ontology#parentADM4'), multiple: false do |index|
      index.as :stored_searchable
    end

    # eg. NCARules local administrative unit
    property :parent_ADM3, predicate: ::RDF::URI.new('http://www.geonames.org/ontology#parentADM3'), multiple: false do |index|
      index.as :stored_searchable
    end
    # eg. NCARules county/wider administrative unit
    property :parent_ADM2, predicate: ::RDF::URI.new('http://www.geonames.org/ontology#parentADM2'), multiple: false do |index|
      index.as :stored_searchable
    end

    # eg. NCARules country (England)
    property :parent_ADM1, predicate: ::RDF::URI.new('http://www.geonames.org/ontology#parentADM1'), multiple: false do |index|
      index.as :stored_searchable
    end

    # eg. UK
    property :parent_country, predicate: ::RDF::URI.new('http://www.geonames.org/ontology#parentCountry'), multiple: false do |index|
      index.as :stored_searchable
    end

    property :note, predicate: Dlibhydra::Vocab::BorthwickRegisters..note, multiple: true do |index|
      index.as :stored_searchable
    end

    def place?
      true
    end

  end
end