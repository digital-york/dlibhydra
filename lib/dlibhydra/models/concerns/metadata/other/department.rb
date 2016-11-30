module Dlibhydra
  # thesis metadata
  module Department
    extend ActiveSupport::Concern

    included do

      has_and_belongs_to_many :department_resource,
                              class_name: 'Dlibhydra::CurrentOrganisation',
                              predicate: Dlibhydra::Vocab::LocalResourceTerms.localDepartment

      # String only, use _resource for Object reference
      property :department, predicate: Dlibhydra::Vocab::Uketd.department, multiple: true do |index|
        index.as :stored_searchable
      end

      def add_department_values
        self.department = department_resource.collect { |x| x.preflabel }
      end
    end
  end
end
