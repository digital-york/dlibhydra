module Dlibhydra
  module FoafName
    extend ActiveSupport::Concern

    included do
      # also vra:name
      # eg. NCA Rules 4
      property :name, predicate: ::RDF::Vocab::FOAF.name, multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end