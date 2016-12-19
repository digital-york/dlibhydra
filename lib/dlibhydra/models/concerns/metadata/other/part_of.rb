module Dlibhydra
  # PartOf
  module PartOf
    extend ActiveSupport::Concern

    included do
      property :part_of, predicate: ::RDF::URI.new('https://vocab.org/frbr/core#'),
                           multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
