module Dlibhydra
  # add mandatory datacite elements
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
            Dlibhydra::ThesisMetadata
  end
end
