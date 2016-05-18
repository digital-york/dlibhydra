class DataFileSet < ActiveFedora::Base
  include Hydra::Works::FileSetBehavior,
          Dlibhydra::SkosLabels,
          Dlibhydra::AddRdfsLabel,
          Dlibhydra::AddDcTitle,
          Dlibhydra::ValidateLabel

  def data?
    true
  end

end