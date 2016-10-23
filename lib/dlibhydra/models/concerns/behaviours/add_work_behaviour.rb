module Dlibhydra
  module AddWorkBehaviour
    extend ActiveSupport::Concern

    include Hydra::Works::WorkBehavior
    include CurationConcerns::WorkBehavior

    # There was a problem with CurationConcerns::NestedWorks
    # Not sure what all of these are actually doing
    # include Hydra::Works::WorkBehavior
    # include CurationConcerns::HumanReadableType
    # include CurationConcerns::Noid
    # include CurationConcerns::Permissions
    # include CurationConcerns::Serializers
    # include Hydra::WithDepositor
    # include Solrizer::Common
    # include CurationConcerns::HasRepresentative
    # include CurationConcerns::WithFileSets
    # include CurationConcerns::Naming
    # include CurationConcerns::RequiredMetadata
    # include Hydra::AccessControls::Embargoable
    # include GlobalID::Identification
  end
end