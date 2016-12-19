module Dlibhydra
  # add exam paper metadata
  module AddJournalArticleMetadata
    extend ActiveSupport::Concern
    include Dlibhydra::AddLabels,
            Dlibhydra::AddDcDescriptive,
            Dlibhydra::DcRights,
            Dlibhydra::FormerIdentifier,

            Dlibhydra::PartOf,
            Dlibhydra::IssueNumber,
            Dlibhydra::VolumeNumber,
            Dlibhydra::Pagination

  end
end
