module Dlibhydra
  # collections category
  module CollectionsCategory
    extend ActiveSupport::Concern

    included do
      property :collections_category, predicate: Dlibhydra::Vocab::Generic.collectionsCategory,
                           multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
