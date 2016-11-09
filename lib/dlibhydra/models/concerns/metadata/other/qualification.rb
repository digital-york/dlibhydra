module Dlibhydra
  # thesis metadata
  module Qualification
    extend ActiveSupport::Concern

    included do
      before_save :add_qualification_name_values

      has_and_belongs_to_many :qualification_name_resource,
                              class_name: 'Dlibhydra::Concept',
                              predicate: Dlibhydra::Vocab::LocalResourceTerms.qualificationLevel

      # String only, use _resource for Object reference
      property :qualification_level, predicate: Dlibhydra::Vocab::Uketd.qualificationLevel, multiple: true do |index|
        index.as :stored_searchable
      end

      # same as Dlibhydra::Vocab::Uketd.qualificationName
      property :qualification_name, predicate: Dlibhydra::Vocab::Uketd.qualificationName, multiple: true do |index|
        index.as :stored_searchable
      end

      def add_qualification_name_values
        self.qualification_name = qualification_name_resource.collect { |x| x.preflabel }
      end
    end
  end
end
