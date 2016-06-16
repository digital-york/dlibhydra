module Dlibhydra
  module Archivematica
    extend ActiveSupport::Concern

    included do
      property :status, predicate: Dlibhydra::Vocab::OaisArchivematica.status, multiple: false do |index|
        index.as :stored_searchable
      end
      property :size, predicate: Dlibhydra::Vocab::OaisArchivematica.size, multiple: false do |index|
        index.as :stored_searchable
      end
      property :current_full_path, predicate: Dlibhydra::Vocab::OaisArchivematica.currentFullPath, multiple: false do |index|
        index.as :stored_searchable
      end
      property :currentPath, predicate: Dlibhydra::Vocab::OaisArchivematica.currentPath, multiple: false do |index|
        index.as :stored_searchable
      end
      property :current_location, predicate: Dlibhydra::Vocab::OaisArchivematica.currentLocation, multiple: false do |index|
        index.as :stored_searchable
      end
      property :origin_pipeline, predicate: Dlibhydra::Vocab::OaisArchivematica.originPipeline, multiple: false do |index|
        index.as :stored_searchable
      end
      property :resource_uri, predicate: Dlibhydra::Vocab::OaisArchivematica.resourceUri, multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end
