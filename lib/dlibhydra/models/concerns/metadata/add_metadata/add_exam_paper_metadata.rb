module Dlibhydra
  # add exam paper metadata
  module AddExamPaperMetadata
    extend ActiveSupport::Concern
    include Dlibhydra::AddLabels,
            Dlibhydra::AddDcDescriptive,
            Dlibhydra::DcRights,
            Dlibhydra::FormerIdentifier,
            Dlibhydra::GenericModuleCode,
            Dlibhydra::MainFile,
            Dlibhydra::Qualification

  end
end
