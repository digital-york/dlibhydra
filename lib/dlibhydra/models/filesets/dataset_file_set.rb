class DatasetFileSet < ActiveFedora::Base
  include Hydra::Works::FileSetBehavior,
          Dlibhydra::SkosLabels,
          Dlibhydra::AddRdfsLabel,
          Dlibhydra::AddDcTitle,
          Dlibhydra::ValidateLabel,
          Dlibhydra::AssignId

end