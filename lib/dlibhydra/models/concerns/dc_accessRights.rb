module Dlibhydra
  module DcAccessRights
    extend ActiveSupport::Concern

    included do
      property :date_available, predicate: ::RDF::Vocab::DC.accessRights, multiple: false do |index|
        index.as :stored_searchable, :sortable
      end
    end
  end
end
