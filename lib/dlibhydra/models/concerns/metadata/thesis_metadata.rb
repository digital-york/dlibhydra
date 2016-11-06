module Dlibhydra
  # thesis metadata
  module ThesisMetadata
    extend ActiveSupport::Concern

    included do
      before_save :add_thesis_values

      has_and_belongs_to_many :advisor_resource,
                              class_name: 'Dlibhydra::CurrentPerson',
                              predicate: Dlibhydra::Vocab::LocalResourceTerms.advisor

      has_and_belongs_to_many :awarding_institution_resource,
                              class_name: 'Dlibhydra::CurrentOrganisation',
                              predicate: Dlibhydra::Vocab::LocalResourceTerms.awardingInstitution

      property :date_of_award, predicate: ::RDF::Vocab::DC.dateAccepted, multiple: false do |index|
        index.as :stored_searchable
      end
      # String only, use _resource for Object reference
      property :advisor, predicate: Dlibhydra::Vocab::Uketd.advisor, multiple: true do |index|
        index.as :stored_searchable
      end
      # String only, use _resource for Object reference
      # same as Dlibhydra::Vocab::Uketd.institution and bibo:issuer
      property :awarding_institution, predicate: ::RDF::Vocab::Bibframe.dissertationInstitution, multiple: true do |index|
        index.as :stored_searchable
      end

      def add_thesis_values
        self.advisor = advisor_resource.collect { |x| x.preflabel }
        self.awarding_institution = awarding_institution_resource.collect { |x| x.preflabel }
      end
    end
  end
end
