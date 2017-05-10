module Dlibhydra
  # External File Properties
  module ExternalFileProperties
    extend ActiveSupport::Concern

    included do
      property :filetype, predicate: Dlibhydra::Vocab::Generic.FileType,
                           multiple: false do |index|
        index.as :stored_searchable
      end

      property :external_file_url, predicate: Dlibhydra::Vocab::Generic.ExternalFileUrl,
               multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end
