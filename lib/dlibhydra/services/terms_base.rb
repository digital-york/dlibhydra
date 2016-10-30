module Dlibhydra
  class TermsBase

    attr_reader :subauthority

    def initialize(subauthority)
      @subauthority = subauthority
    end

    # Gets the ConceptScheme, etc
    def terms_id
      parse_terms_id_response(SolrQuery.new.solr_query(q='has_model_ssim:"Dlibhydra::ConceptScheme" AND preflabel_tesim:"' + terms_list + '"'))
    end

    def all
      # 'Languages' are sorted by id so that 'Latin' is first
      sort_order = 'preflabel_si asc'
      if terms_list == 'languages'
        sort_order = 'id asc'
      end
      parse_authority_response(SolrQuery.new.solr_query(q='inScheme_ssim:"' + terms_id + '"',fl='id,preflabel_tesim,definition_tesim,broader_ssim',rows=1000,sort=sort_order))
    end

    def find id
      parse_authority_response(SolrQuery.new.solr_query(q='inScheme_ssim:"' + terms_id + '" AND id:"' + id + '"',fl='id,preflabel_tesim,definition_tesim,broader_ssim'))
    end

    # use preflabel_si to get exact match (string instead of token)
    def find_id val
      parse_terms_id_response(SolrQuery.new.solr_query(q='inScheme_ssim:"' + terms_id + '" AND preflabel_si:"' + val + '"', fl='id'))
    end

    # use preflabel_si to get exact match (string instead of token)
    def find_id_with_alts val
      parse_terms_id_response(SolrQuery.new.solr_query(q='inScheme_ssim:"' + terms_id + '" AND (preflabel_si:"' + val + '" OR altlabel_tesim:"' + val + '")', fl='id'))
    end

    def find_value_string id
      parse_string(SolrQuery.new.solr_query(q='inScheme_ssim:"' + terms_id + '" AND id:"' + id + '"', fl='preflabel_tesim'))
    end

    def search q
      parse_authority_response(SolrQuery.new.solr_query(q='inScheme_ssim:"' + terms_id + '" AND preflabel_tesim:"' + q + '"',fl='id,preflabel_tesim,definition_tesim,broader_ssim'))
    end

    # Dereference id into a string for display purposes - e.g. test:101 -> 'abbey'
    def get_str_from_id(id, type)
      response = SolrQuery.new.solr_query(q='id:"' + id + '"', fl=type, rows='1')
      parse_terms_response(response, type);
    end

    # Construct place same_as string for the view / edit pages
    def get_place_same_as(same_as)

      response = SolrQuery.new.solr_query(q='id:' + same_as, fl='preflabel_tesim', rows='1')

      place_same_as = nil

      response['response']['docs'].map do |result|

        place_same_as = result['preflabel_tesim'][0]

        if place_same_as == nil
          place_same_as = "ERROR"
        end
      end

      return place_same_as
    end

    # Construct person same_as string for the view / edit pages
    def get_person_same_as(same_as)

      response = SolrQuery.new.solr_query(q='id:' + same_as, fl='preflabel_tesim', rows='1')

      person_same_as = nil

      response['response']['docs'].map do |result|

        person_same_as = result['preflabel_tesim'][0]

        if person_same_as == nil
          person_same_as = "ERROR"
        end

      end

      return person_same_as
    end

    # Returns an array of hashes (top-level terms) which contain an array of hashes (middle-level terms), etc
    # These are dereferenced in the subjects pop-up to dispay the subject list
    def all_top_level_subject_terms

      # all_terms_list = []
      # middle_level_list = []
      # bottom_level_list = []

      top_level_list = parse_authority_response(SolrQuery.new.solr_query(q='istopconcept_tesim:true',fl='id,preflabel_tesim',rows=1000,sort='preflabel_si asc'))

      top_level_list.each_with_index do |t1, index|

        id = t1['id']

        middle_level_list = parse_authority_response(SolrQuery.new.solr_query(q='broader_ssim:' + id,fl='id,preflabel_tesim',rows=1000, sort='preflabel_si asc'))

        t1[:elements] = middle_level_list

        middle_level_list.each_with_index do |t2, index|

          id2 = t2['id']

          bottom_level_list = parse_authority_response(SolrQuery.new.solr_query(q='broader_ssim:' + id2,fl='id,preflabel_tesim',rows=1000, sort='preflabel_si asc'))

          t2[:elements] = bottom_level_list

        end

      end

      return top_level_list

    end

    # Returns an array of hashes (top-level terms) which contain an array of hashes (middle-level terms), etc
    # These are dereferenced in the subjects pop-up to dispay the subject list
    def get_subject_list_top_level

      top_level_list = parse_authority_response(SolrQuery.new.solr_query(q='istopconcept_tesim:true',fl='id,preflabel_tesim',rows=1000,sort='preflabel_si asc'))

      top_level_list.each_with_index do |t1, index|

        id = t1['id']

        second_level_list = parse_authority_response(SolrQuery.new.solr_query(q='broader_ssim:' + id,fl='id,preflabel_tesim',rows=1000, sort='preflabel_si asc'))

        t1[:elements] = second_level_list

        second_level_list.each_with_index do |t2, index|

          id2 = t2['id']

          third_level_list = parse_authority_response(SolrQuery.new.solr_query(q='broader_ssim:' + id2,fl='id,preflabel_tesim',rows=1000, sort='preflabel_si asc'))

          t2[:elements] = third_level_list
        end
      end

      return top_level_list
    end

    def get_subject_list_second_level(id)

      top_level_list = parse_authority_response(SolrQuery.new.solr_query(q='istopconcept_tesim:true AND id:' + id,fl='id,preflabel_tesim',rows=1000,sort='preflabel_si asc'))

      top_level_list.each do |t1|

        #id = t1['id']

        second_level_list = parse_authority_response(SolrQuery.new.solr_query(q='broader_ssim:' + id,fl='id,preflabel_tesim',rows=1000, sort='preflabel_si asc'))

        t1[:elements] = second_level_list

        second_level_list.each do |t2|

          id2 = t2['id']

          third_level_list = parse_authority_response(SolrQuery.new.solr_query(q='broader_ssim:' + id2,fl='id,preflabel_tesim',rows=1000, sort='preflabel_si asc'))

          t2[:elements] = third_level_list
        end
      end

      return top_level_list
    end


    private

    # Reformats the data received from the service
    def parse_authority_response(response)
      response['response']['docs'].map do |result|
        hash = {'id' => result['id'],
         'label' => if result['preflabel_tesim'] then result['preflabel_tesim'].join end,
         'definition' => if result['definition_tesim'] then result['definition_tesim'].join end
        }
        # Only add broader where it exists (ie. subjects)
        #assumes only one broader
        if result['broader_ssim']
          hash['broader_id'] = result['broader_ssim'].join
          hash['broader_label'] = find_value_string(result['broader_ssim'].join).join
        end
        hash
      end
    end

    def parse_terms_id_response(response)
      id = ''
      response['response']['docs'].map do |result|
        id = result['id']
      end
      id
    end

    def parse_string(response)
      str = ''
      response['response']['docs'].map do |result|
        str = result['preflabel_tesim']
      end
      str
    end

    # General method to parse ids into strings (py)
    def parse_terms_response(response, type)

      str = ''

      response['response']['docs'].map do |result|
        if result['numFound'] != '0'
          str = result[type]
          if str.class == Array
            str = str.join() # 'join' is used to convert an array into a string because otherwise an error occurs
          end
        end
      end

      return str
    end

  end
end
