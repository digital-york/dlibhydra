module Dlibhydra
  # number of downloads
  module NumberOfDownloads
    extend ActiveSupport::Concern

    included do
      property :number_of_downloads, predicate: Dlibhydra::Vocab::Generic.numberOfDownloads,
                             multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end
