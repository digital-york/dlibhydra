class MainFileSet < ActiveFedora::Base
  include Hydra::Works::FileSetBehavior,
          Dlibhydra::SkosLabels,
          Dlibhydra::AddRdfsLabel,
          Dlibhydra::AddDcTitle,
          Dlibhydra::ValidateLabel

  def main?
    true
  end

end