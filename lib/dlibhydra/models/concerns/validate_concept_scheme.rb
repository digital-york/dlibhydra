module Dlibhydra
  module ConceptSchemeBehaviour
    extend ActiveSupport::Concern

    included do
      def self.type_validator
        Hydra::PCDM::Validators::CompositeValidator.new(
            Dlibhydra::ConceptSchemeMemberValidator
        )
      end
    end
  end
end