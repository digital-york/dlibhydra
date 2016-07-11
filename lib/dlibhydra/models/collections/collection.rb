module Dlibhydra
  class Collection < ActiveFedora::Base
    include Hydra::Works::CollectionBehavior,
          Dlibhydra::SkosLabels,
          Dlibhydra::DcTitle,
          Dlibhydra::AddLabels,
          Dlibhydra::ValidateLabel,
          Dlibhydra::DcKeywordSubject,
          Dlibhydra::DcRights
  end
end
