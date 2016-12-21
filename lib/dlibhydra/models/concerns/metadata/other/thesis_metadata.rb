module Dlibhydra
  # thesis metadata
  module ThesisMetadata
    extend ActiveSupport::Concern

    included do

      has_and_belongs_to_many :advisor_resource,
                              class_name: 'Dlibhydra::CurrentPerson',
                              predicate: Dlibhydra::Vocab::Uketd.advisor

      has_and_belongs_to_many :awarding_institution_resource,
                              class_name: 'Dlibhydra::CurrentOrganisation',
                              predicate: ::RDF::Vocab::Bibframe.dissertationInstitution

      property :date_of_award, predicate: ::RDF::Vocab::DC.dateAccepted, multiple: false do |index|
        index.as :stored_searchable
      end

    end
  end
end
