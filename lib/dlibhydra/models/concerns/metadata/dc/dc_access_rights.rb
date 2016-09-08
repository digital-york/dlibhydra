module Dlibhydra
  module DcAccessRights
    extend ActiveSupport::Concern

    included do
      property :access_rights, predicate: ::RDF::Vocab::DC.accessRights, multiple: false do |index|
        index.as :stored_searchable
        # solr indexing will also be handled by bespoke routine in dataset.rb
      end
    end

  end
end
