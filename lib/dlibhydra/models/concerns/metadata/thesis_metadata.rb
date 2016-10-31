module Dlibhydra
  # thesis metadata
  module ThesisMetadata
    extend ActiveSupport::Concern

    included do

      # has_and_belongs_to_many :advisor_resource,
      #                         class_name: 'Dlibhydra::CurrentPerson',
      #                         predicate: Dlibhydra::Vocab::Uketd.advisor
      #
      # has_and_belongs_to_many :department_resource,
      #                         class_name: 'Dlibhydra::CurrentOrganisation',
      #                         predicate: Dlibhydra::Vocab::Uketd.department
      #
      # has_and_belongs_to_many :qualification_level_resource,
      #                         class_name: 'Dlibhydra::Concept',
      #                         predicate: Dlibhydra::Vocab::Uketd.qualificationLevel
      #
      # has_and_belongs_to_many :awarding_institution_resource,
      #                         class_name: 'Dlibhydra::CurrentOrganisation',
      #                         predicate: ::RDF::Vocab::Bibframe.dissertationInstitution

      property :date_of_award, predicate: ::RDF::Vocab::DC.dateAccepted, multiple: false do |index|
        index.as :stored_searchable
      end

      # String only, use _resource for Object reference
      property :advisor, predicate: Dlibhydra::Vocab::Uketd.advisor, multiple: true do |index|
        index.as :stored_searchable
      end
      # String only, use _resource for Object reference
      property :department, predicate: Dlibhydra::Vocab::Uketd.department, multiple: true do |index|
        index.as :stored_searchable
      end

      # String only, use _resource for Object reference
      # same as Dlibhydra::Vocab::Uketd.institution and bibo:issuer
      property :awarding_institution, predicate: ::RDF::Vocab::Bibframe.dissertationInstitution, multiple: false do |index|
        index.as :stored_searchable
      end

      # String only, use _resource for Object reference
      property :qualification_level, predicate: Dlibhydra::Vocab::Uketd.qualificationLevel, multiple: false do |index|
        index.as :stored_searchable
      end

      # same as Dlibhydra::Vocab::Uketd.qualificationName
      property :qualification_name, predicate: Dlibhydra::Vocab::Uketd.qualificationName, multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end
