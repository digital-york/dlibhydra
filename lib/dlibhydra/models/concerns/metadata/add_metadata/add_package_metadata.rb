module Dlibhydra
  # add package metadata
  module AddPackageMetadata
    extend ActiveSupport::Concern
    include Dlibhydra::AddLabels,
            Dlibhydra::Archivematica,
            Dlibhydra::RdfType, # needed for add_types callback
            Dlibhydra::SimpleVersions
  end
end
