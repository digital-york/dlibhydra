require 'rubygems'
require 'rsolr'
require 'yaml'

# Simple solr query helper class
module Dlibhydra
  class SolrQuery

    def solr_query(q, fl='id', rows=10, sort='', start=0)
      ActiveFedora::SolrService.get('select', :params => {
          :q => q,
          :fl => fl,
          :rows => rows,
          :sort => sort,
          :start => start
      })
    end
  end
end
