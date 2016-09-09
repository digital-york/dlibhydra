module Dlibhydra
  # DC rights holder and license
  # TODO: align with Hydra / CC
  module DcRights
    extend ActiveSupport::Concern

    included do
      # Same as cc:attributionName.
      property :rights_holder, predicate: ::RDF::Vocab::DC.rightsHolder,
                               multiple: false do |index|
        index.as :stored_searchable
      end

      # Same as cc:license.
      property :license, predicate: ::RDF::Vocab::DC.license,
                         multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end
