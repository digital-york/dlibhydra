module Dlibhydra
  module DcAccessRights
    extend ActiveSupport::Concern

    included do
      property :access_rights, predicate: ::RDF::Vocab::DC.accessRights, multiple: false do |index|
        index.as :stored_searchable, :stored_sortable, :sortable
        index.type :text
      end
    end
  end
end
