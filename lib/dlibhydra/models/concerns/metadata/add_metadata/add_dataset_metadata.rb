module Dlibhydra
  # add dataset metadata
  module AddDatasetMetadata
    extend ActiveSupport::Concern
    include Dlibhydra::AddDataciteMandatory,
            Dlibhydra::ForIndexing,
            Dlibhydra::DcAccessRights,
            Dlibhydra::Pure,
            Dlibhydra::Doi,
            Dlibhydra::SimpleVersions,
            Dlibhydra::GenericWorkflow,
            Dlibhydra::ReadmeFile,
            Dlibhydra::LastAccess

  end
end
