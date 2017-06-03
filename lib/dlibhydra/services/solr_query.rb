require 'rubygems'
require 'rsolr'
require 'yaml'

# Simple solr query helper class
module Dlibhydra
  class SolrQuery

    def solr_query(q, fl='id', rows=10, sort='', start=0)
      # use the solr instance already loaded in ActiveFedora rather than digging it out of config/solr.yml (which might contain ERB)
      ActiveFedora::SolrService.instance.conn.get('select', :params => {
          :q => q,
          :fl => fl,
          :rows => rows,
          :sort => sort,
          :start => start
      })
    end
  end
end
