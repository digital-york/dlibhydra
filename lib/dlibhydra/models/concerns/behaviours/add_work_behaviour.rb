module Dlibhydra
  module AddWorkBehaviour
    extend ActiveSupport::Concern
    # include Hyrax::WorkBehavior
    # These are what WorkBehavior includes:
    include Hydra::Works::WorkBehavior
    include Hyrax::HumanReadableType
    include Hyrax::Noid
    include Hyrax::Permissions
    include Hyrax::Serializers
    include Hydra::WithDepositor
    include Solrizer::Common
    include Hyrax::HasRepresentative
    include Hyrax::WithFileSets
    include Hyrax::Naming
    include Hyrax::RequiredMetadata
    include Hyrax::InAdminSet
    include Hydra::AccessControls::Embargoable
    include GlobalID::Identification
    include Hyrax::Suppressible
    # RuntimeError: Circular dependency detected while autoloading constant Thesis
    # In CC app
    # include Hyrax::NestedWorks
  end
end