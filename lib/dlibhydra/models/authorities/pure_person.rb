module Dlibhydra
  class PurePerson < ActiveFedora::Base

    include Hydra::Works::WorkBehavior,
            Dlibhydra::SameAs,
            Dlibhydra::SkosLabels,
            Dlibhydra::AddRdfsLabel,
            Dlibhydra::AddDcTitle,
            Dlibhydra::ValidateLabel,
            Dlibhydra::Pure,
            Dlibhydra::AssignId

    #belongs_to :concept_scheme, class_name: 'Dlibhydra::ConceptScheme', predicate: ::RDF::SKOS.inScheme

    type << ::RDF::URI.new('http://schema.org/Person')
    type << Dlibhydra::Vocab::PureTerms.PurePerson

    property :family, predicate: ::RDF::Vocab::FOAF.familyName, multiple: false do |index|
      index.as :stored_searchable
    end

    property :given_name, predicate: ::RDF::FOAF.givenName, multiple: false do |index|
      index.as :stored_searchable
    end

    def pure_person?
      true
    end
    def is_phd
      type << Dlibhydra::Vocab::PureTerms.PurePersonPhd
    end
  end
end