module Dlibhydra
  module AddDcTitle
    extend ActiveSupport::Concern

    included do
      property :rdfs_label, predicate: ::RDF::RDFS.label, multiple: false do |index|
        index.as :stored_searchable
      end
      before_save :map_labels
    end

    def map_labels
      self.rdfs_label = self.preflabel
    end
  end
end
