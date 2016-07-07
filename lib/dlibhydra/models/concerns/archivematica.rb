module Dlibhydra
  module Archivematica
    extend ActiveSupport::Concern

    # TODO should vocab distinguish AIP from DIP?
    # TODO which of these do we actually need?
    # removed resource_uri

    included do
      property :aip_uuid, predicate: Dlibhydra::Vocab::OaisArchivematica.aipUuid, multiple: false do |index|
        index.as :stored_searchable
      end
      property :transfer_uuid, predicate: Dlibhydra::Vocab::OaisArchivematica.aipUuid, multiple: false do |index|
        index.as :stored_searchable
      end
      property :sip_uuid, predicate: Dlibhydra::Vocab::OaisArchivematica.aipUuid, multiple: false do |index|
        index.as :stored_searchable
      end
      property :dip_uuid, predicate: Dlibhydra::Vocab::OaisArchivematica.dipUuid, multiple: false do |index|
        index.as :stored_searchable
      end
      property :dip_location, predicate: Dlibhydra::Vocab::OaisArchivematica.dipLocation, multiple: false do |index|
        index.as :stored_searchable
      end
      property :aip_status, predicate: Dlibhydra::Vocab::OaisArchivematica.status, multiple: false do |index|
        index.as :stored_searchable
      end
      property :dip_status, predicate: Dlibhydra::Vocab::OaisArchivematica.status, multiple: false do |index|
        index.as :stored_searchable
      end
      property :aip_size, predicate: Dlibhydra::Vocab::OaisArchivematica.size, multiple: false do |index|
        index.as :stored_searchable
      end
      property :dip_size, predicate: Dlibhydra::Vocab::OaisArchivematica.size, multiple: false do |index|
        index.as :stored_searchable
      end
      property :aip_current_full_path, predicate: Dlibhydra::Vocab::OaisArchivematica.currentFullPath, multiple: false do |index|
        index.as :stored_searchable
      end
      property :dip_current_full_path, predicate: Dlibhydra::Vocab::OaisArchivematica.currentFullPath, multiple: false do |index|
        index.as :stored_searchable
      end
      property :aip_current_path, predicate: Dlibhydra::Vocab::OaisArchivematica.currentPath, multiple: false do |index|
        index.as :stored_searchable
      end
      property :dip_current_path, predicate: Dlibhydra::Vocab::OaisArchivematica.currentPath, multiple: false do |index|
        index.as :stored_searchable
      end
      property :aip_current_location, predicate: Dlibhydra::Vocab::OaisArchivematica.currentLocation, multiple: false do |index|
        index.as :stored_searchable
      end
      property :dip_current_location, predicate: Dlibhydra::Vocab::OaisArchivematica.currentLocation, multiple: false do |index|
        index.as :stored_searchable
      end
      property :origin_pipeline, predicate: Dlibhydra::Vocab::OaisArchivematica.originPipeline, multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end
