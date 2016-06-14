module Dlibhydra
  module DcTerms
    extend ActiveSupport::Concern

    included do
      property :identifier, predicate: ::RDF::Vocab::DC.identifier, multiple: false do |index|
        index.as :stored_searchable, :sortable
      end
      property :description, predicate: ::RDF::Vocab::DC.description, multiple: false do |index|
        index.as :stored_searchable
      end
      # TODO move/remove format - where is it used?
      property :format, predicate: ::RDF::Vocab::DC.format, multiple: true do |index|
        index.as :stored_searchable
      end
      property :date, predicate: ::RDF::Vocab::DC.date, multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end
