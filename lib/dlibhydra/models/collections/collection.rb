module Dlibhydra
  class Collection < ActiveFedora::Base
    include Hydra::Works::CollectionBehavior,
          Dlibhydra::AddLabels,
          Dlibhydra::AddDcDescriptive
  end
end
