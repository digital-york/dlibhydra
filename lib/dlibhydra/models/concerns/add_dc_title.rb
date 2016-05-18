module Dlibhydra
  module AddDcTitle
    extend ActiveSupport::Concern

    included do
      property :title, predicate: ::RDF::Vocab::DC.title, multiple: false do |index|
        index.as :stored_searchable, :sortable
      end
      before_save :map_labels
    end

    def map_labels
      self.title = self.preflabel
    end
  end
end
