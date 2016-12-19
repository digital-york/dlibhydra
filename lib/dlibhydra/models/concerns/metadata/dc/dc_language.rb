module Dlibhydra
  # DC language
  module DcLanguage
    extend ActiveSupport::Concern

    included do
      before_save :add_language_string
      # language code
      property :language, predicate: ::RDF::Vocab::DC.language,
                          multiple: true do |index|
        index.as :stored_searchable
      end

      property :language_string, predicate: ::RDF::Vocab::DC11.language,
               multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end

      # This requires that the calling app has QA installed and the languages list available
      def add_language_string
        begin
          auth = Qa::Authorities::Local::FileBasedAuthority.new('languages')
          self.language_string = self.language.collect { |x| auth.find(x)['term'] }
        rescue
          'You need QA installed to add language_string'
        end
      end
    end
  end
end
