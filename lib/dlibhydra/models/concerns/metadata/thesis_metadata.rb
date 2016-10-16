module Dlibhydra
  # thesis metadata
  module ThesisMetadata
    extend ActiveSupport::Concern

    included do

      #     property :author, predicate: ::RDF::Vocab::DC.creator, multiple: false do |index|
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

      # same as Dlibhydra::Vocab::Uketd.institution and bibo:issuer
      property :awarding_institution, predicate: ::RDF::Vocab::Bibframe.dissertationInstitution, multiple: false do |index|
        index.as :stored_searchable
      end

      property :qualification_level, predicate: Dlibhydra::Vocab::Uketd.qualificationLevel, multiple: false do |index|
        index.as :stored_searchable
      end

      # same as Dlibhydra::Vocab::Uketd.qualificationName
      property :qualification_name, predicate: ::RDF::URI.new('http://vivoweb.org/ontology/core#AcademicDegree'), multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end
