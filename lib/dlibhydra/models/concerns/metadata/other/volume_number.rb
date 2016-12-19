module Dlibhydra
  # Volume Number
  module VolumeNumber
    extend ActiveSupport::Concern

    included do
      property :volume_number, predicate: ::RDF::URI.new('https://schema.org/volumeNumber'),
                           multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
