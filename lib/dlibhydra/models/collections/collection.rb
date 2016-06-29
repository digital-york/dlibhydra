class Collection < ActiveFedora::Base
  include Hydra::Works::CollectionBehavior,
          Dlibhydra::SkosLabels,
          Dlibhydra::AddRdfsLabel,
          Dlibhydra::AddDcTitle,
          Dlibhydra::ValidateLabel,
          Dlibhydra::DcKeywordSubject,
          Dlibhydra::DcRights
end