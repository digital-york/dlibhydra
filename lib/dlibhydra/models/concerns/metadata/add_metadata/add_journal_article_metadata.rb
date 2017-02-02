module Dlibhydra
  # add journal article metadata
  module AddJournalArticleMetadata
    extend ActiveSupport::Concern

    include Dlibhydra::CommonMetadata,
            Dlibhydra::IssueNumber,
            Dlibhydra::VolumeNumber,
            Dlibhydra::Pagination,
            Dlibhydra::JournalArticleMetadata
#    include Dlibhydra::PartOf,

  end
end
