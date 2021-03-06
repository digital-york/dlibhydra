module Dlibhydra
  # DC rights holder and license
  module DcRights
    extend ActiveSupport::Concern

    included do
      # Align with https://wiki.duraspace.org/display/hydra/Rights+Metadata+Recommendation
      # Same as cc:attributionName.
      property :rights_holder, predicate: ::RDF::Vocab::DC.rightsHolder,
               multiple: true do |index|
        index.as :stored_searchable
      end

      # Align with https://wiki.duraspace.org/display/hydra/Rights+Metadata+Recommendation
      property :rights, predicate: ::RDF::Vocab::EDM.rights,
               multiple: true do |index|
        index.as :stored_searchable
      end

      # Same as cc:license.
      # DO NOT USE
      property :license, predicate: ::RDF::Vocab::DC.license,
               multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end