module Dlibhydra
  # thesis metadata
  module Department
    extend ActiveSupport::Concern

    included do

      has_and_belongs_to_many :department_resource,
                              class_name: 'Dlibhydra::CurrentOrganisation',
                              predicate: Dlibhydra::Vocab::Uketd.department

    end
  end
end
