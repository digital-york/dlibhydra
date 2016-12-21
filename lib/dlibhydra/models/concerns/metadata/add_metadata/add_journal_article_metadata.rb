module Dlibhydra
  # add journal article metadata
  module AddJournalArticleMetadata
    extend ActiveSupport::Concern

    include Dlibhydra::CommonMetadata

    include Dlibhydra::IssueNumber,
            Dlibhydra::VolumeNumber,
            Dlibhydra::Pagination

    include Dlibhydra::JournalArticleMetadata
#    include Dlibhydra::PartOf,

  end
end
