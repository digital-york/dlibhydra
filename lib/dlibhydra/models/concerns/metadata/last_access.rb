module Dlibhydra
  module LastAccess
    extend ActiveSupport::Concern

    included do
      property :last_access, predicate: Dlibhydra::Vocab::Generic.lastAccess, multiple: false do |index|
        index.as :stored_searchable
      end
    end

  end
end
