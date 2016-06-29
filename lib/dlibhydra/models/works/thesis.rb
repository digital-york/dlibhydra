class Thesis < ActiveFedora::Base
  include Hydra::Works::WorkBehavior,
          Dlibhydra::SkosLabels,
          Dlibhydra::AddRdfsLabel,
          Dlibhydra::AddDcTitle,
          Dlibhydra::ValidateLabel,
          Dlibhydra::DcKeywordSubject,
          Dlibhydra::DcRights



end
