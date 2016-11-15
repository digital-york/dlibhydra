module Dlibhydra
  # add thesis metadata
  module AddThesisMetadata
    extend ActiveSupport::Concern
    include Dlibhydra::AddLabels,
            Dlibhydra::AddDcDescriptive,
            Dlibhydra::DcRights,
            Dlibhydra::DcAbstract,
            Dlibhydra::Doi,
            Dlibhydra::FormerIdentifier,
            Dlibhydra::Orcid,
            Dlibhydra::MainFile,
            Dlibhydra::Department,
            Dlibhydra::Qualification,
            Dlibhydra::ThesisMetadata

  end
end
