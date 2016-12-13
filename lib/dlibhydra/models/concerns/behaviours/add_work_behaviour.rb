module Dlibhydra
  module AddWorkBehaviour
    extend ActiveSupport::Concern
    # include CurationConcerns::WorkBehavior
    # These are what WorkBehavior includes:
    include Hydra::Works::WorkBehavior
    include CurationConcerns::HumanReadableType
    include CurationConcerns::Noid
    include CurationConcerns::Permissions
    include CurationConcerns::Serializers
    include Hydra::WithDepositor
    include Solrizer::Common
    include CurationConcerns::HasRepresentative
    include CurationConcerns::WithFileSets
    include CurationConcerns::Naming
    include CurationConcerns::RequiredMetadata
    include CurationConcerns::InAdminSet
    include Hydra::AccessControls::Embargoable
    include GlobalID::Identification
    include CurationConcerns::NestedWorks
    include CurationConcerns::Suppressible
    # RuntimeError: Circular dependency detected while autoloading constant Thesis
    # In CC app
    # include CurationConcerns::NestedWorks
  end
end