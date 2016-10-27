module Dlibhydra
  # DC rights holder and license
  # TODO: align with Hydra / CC
  module DcRights
    extend ActiveSupport::Concern

    included do
      # Align with https://wiki.duraspace.org/display/hydra/Rights+Metadata+Recommendation
      # Same as cc:attributionName.
      property :rights_holder, predicate: ::RDF::Vocab::DC.rightsHolder,
               multiple: false do |index|
        index.as :stored_searchable
      end

      # Align with https://wiki.duraspace.org/display/hydra/Rights+Metadata+Recommendation
      property :rights, predicate: ::RDF::Vocab::EDM.rights,
               multiple: false do |index|
        index.as :stored_searchable
      end

      # Same as cc:license.
      # DO NOT USE
      property :license, predicate: ::RDF::Vocab::DC.license,
               multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end