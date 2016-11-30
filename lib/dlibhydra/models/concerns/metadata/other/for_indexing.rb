module Dlibhydra
  # dump field for indexing
  module ForIndexing
    extend ActiveSupport::Concern

    included do
      property :for_indexing, predicate: Dlibhydra::Vocab::Generic.forIndexing,
                              multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
