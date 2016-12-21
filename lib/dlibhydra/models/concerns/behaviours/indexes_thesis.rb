module Dlibhydra
  module IndexesThesis
    extend ActiveSupport::Concern

    included do
      def generate_solr_document

        # Add the object's HABM to 'values_tesim' according to the convention being used.
        #  'values_tesim' is used where the preflabel for the HABM resource is stored in solr only.
        #   These are used by the authorities in it's update_usages method to update all references if the
        #   authority term changes.
        values_to_index = ['creator','subject','qualification_name','department','awarding_institution','advisor']

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

          creator_strings = object.creator_string.collect { |x| x }
          # add creator strings into creator_value
          if object.creator_resource.empty?
            solr_doc['creator_value_tesim'] = creator_strings
            solr_doc['creator_value_ssim'] = creator_strings
            solr_doc['creator_value_sim'] =  creator_strings
          else
            solr_doc['creator_value_tesim'] += creator_strings
            solr_doc['creator_value_ssim'] += creator_strings
            solr_doc['creator_value_sim'] +=  creator_strings
          end
        end
      end
    end

  end
end