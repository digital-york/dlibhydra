module Dlibhydra
  class Thesis < ActiveFedora::Base
    include Hydra::Works::WorkBehavior,
            Dlibhydra::AddLabels,
            Dlibhydra::DcKeywordSubject,
            Dlibhydra::DcRights,
            Dlibhydra::DcAbstract,
            Dlibhydra::DcCreator,
            Dlibhydra::DcLanguage,
            Dlibhydra::DcResourceType,
            Dlibhydra::AssignId

    # Use for the the main file, ie. the deposited thesis
    filters_association :members, as: :main, condition: :main?

    type << ::RDF::URI.new('http://purl.org/ontology/bibo/Thesis')

    # TODO: String, URI or Object, eg. ORCID

    #     property :author, predicate: ::RDF::Vocab::DC.creator, multiple: false do |index|
    #       index.as :stored_searchable
    #     end
    #
    #     property :abstract, predicate: ::RDF::Vocab::DC.abstract, multiple: false do |index|
    #       index.as :stored_searchable
    #     end

    property :date_of_award, predicate: ::RDF::Vocab::DC.dateAccepted, multiple: false do |index|
      index.as :stored_searchable
    end

    property :advisor, predicate: Dlibhydra::Vocab::Uketd.advisor, multiple: true do |index|
      index.as :stored_searchable
    end

    property :department, predicate: Dlibhydra::Vocab::Uketd.department, multiple: true do |index|
      index.as :stored_searchable
    end

    # same as # same as Dlibhydra::Vocab::Uketd.institution and bibo:issuer
    property :awarding_institution, predicate: ::RDF::Vocab::Bibframe.dissertationInstitution, multiple: false do |index|
      index.as :stored_searchable
    end

    property :qualification_level, predicate: Dlibhydra::Vocab::Uketd.qualificationlevel, multiple: false do |index|
      index.as :stored_searchable
    end

    # same as Dlibhydra::Vocab::Uketd.qualificationname
    property :qualification_name, predicate: ::RDF::URI.new('http://vivoweb.org/ontology/core#AcademicDegree'), multiple: false do |index|
      index.as :stored_searchable
    end

    #     property :resource_type, predicate: ::RDF::Vocab::DC.type, multiple: false do |index|
    #       index.as :stored_searchable
    #     end
    #
    #     property :language, predicate: ::RDF::Vocab::DC.language, multiple: false do |index|
    #       index.as :stored_searchable
    #     end

    def thesis?
      true
    end
  end
end
