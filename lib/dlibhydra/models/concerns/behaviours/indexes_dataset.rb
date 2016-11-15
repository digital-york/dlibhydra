module Dlibhydra
  module IndexesDataset
    extend ActiveSupport::Concern

    included do
      def generate_solr_document
        # Add '_value' to 'values_tesim'
        #   this enables update_usages in authorities to update the object
        #   if the authority term changes
        values_to_index = ['creator','publisher','managing_organisation']

        super.tap do |solr_doc|
          # add a stored text index for the 'access_rights' property in solr
          # so that case-insensitive sorting can be done on it
          solr_doc['dc_access_rights_tesi'] = object.dc_access_rights.collect { |x| x }

          solr_doc['values_tesim'] = []
          values_to_index.each do |v|
            method = "#{v}_resource"
            solr_doc["#{v}_value_alt_tesim"] = []
            prefs = object.send(method).collect { |x| x.preflabel }
            solr_doc["#{v}_value_tesim"] = prefs # stored searchable
            solr_doc["#{v}_value_sim"] = prefs # facetable
            object.send(method).each do |a|
              solr_doc["#{v}_value_alt_tesim"] += a.altlabel.to_a
            end
            solr_doc['values_tesim'] += object.send(method).collect { |x| x.id }
          end

        end
      end
    end

  end
end