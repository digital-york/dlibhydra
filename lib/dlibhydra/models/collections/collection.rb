module Dlibhydra
  class Collection < ActiveFedora::Base
    include Hydra::Works::CollectionBehavior,
            Dlibhydra::AssignId,
            Dlibhydra::AddLabels,
            Dlibhydra::AddDcDescriptive,
            Dlibhydra::DcRights
  end
end
