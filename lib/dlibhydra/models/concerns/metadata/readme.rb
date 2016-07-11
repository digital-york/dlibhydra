module Dlibhydra
  module Readme
    extend ActiveSupport::Concern

    included do
      property :readme, predicate: Dlibhydra::Vocab::Generic.readme, multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end
