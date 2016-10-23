module Dlibhydra
  module AddWorkBehaviour
    extend ActiveSupport::Concern

    # Include everything from CC::WorkBehavior except NestedWorks
    include CurationConcerns::WorkBehavior

    # TODO fix issue with NestedWorks and go back to CC::WorkBehavior
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