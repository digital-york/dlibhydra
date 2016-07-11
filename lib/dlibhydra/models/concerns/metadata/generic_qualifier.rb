module Dlibhydra
  module GenericQualifier
    extend ActiveSupport::Concern

    included do
      # eg. NCA Rules 4.4 use for places and status/function/sphere of activity designation as needed
      property :qualifier, predicate: Dlibhydra::Vocab::Generic.qualifier, multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end