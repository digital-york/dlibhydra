module Dlibhydra
  module IndexesCollection
    extend ActiveSupport::Concern

    included do
      def generate_solr_document

        # Add the object's HABM to 'authorities_tesim' or 'values_tesim' according to the convention being used.
        #  'values_tesim' is used where the preflabel for the HABM resource is stored in solr only.
        #  'authorities_tesim' is used where the preflabel for the HABM resource is stored in the object too.
        #   These are used by the authorities in it's update_usages method to update all references if the
        #   authority term changes.
        values_to_index = ['creator','subject', 'publisher']

        super.tap do |solr_doc|
          solr_doc['values_tesim'] = []

          values_to_index.each do |v|
            method = "#{v}_resource"
            solr_doc["#{v}_value_alt_tesim"] = []
            prefs = object.send(method).collect { |x| x.preflabel }
            solr_doc["#{v}_value_tesim"] = prefs # stored searchable
            solr_doc["#{v}_value_ssim"] = prefs
            solr_doc["#{v}_value_sim"] = prefs # facetable TODO check this

            object.send(method).each do |a|
              solr_doc["#{v}_value_alt_tesim"] += a.altlabel.to_a
            end

            solr_doc['values_tesim'] += object.send(method).collect { |x| x.id }
          end

          # creators
          solr_doc['creator_tesim'] = object.creator.collect { |x| x }
          solr_doc['creator_ssim'] = object.creator.collect { |x| x }
          solr_doc['creator_sim'] = object.creator.collect { |x| x }
          solr_doc['creator_tesim'] += solr_doc["creator_value_tesim"].collect { |x| x }
          solr_doc['creator_ssim'] += solr_doc["creator_value_ssim"].collect { |x| x }
          solr_doc['creator_sim'] += solr_doc["creator_value_ssim"].collect { |x| x }
          solr_doc['creator_resource_tesim'] = object.creator_resource_ids.collect { |x| x }

        end
      end
    end

  end
end