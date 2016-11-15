require 'rubygems'
require 'rsolr'
require 'yaml'

# Simple solr query helper class
module Dlibhydra
  class SolrQuery

    CONN = RSolr.connect :url => YAML.load_file('config/solr.yml')[Rails.env]['url']

    def solr_query(q, fl='id', rows=10, sort='', start=0)
      CONN.get 'select', :params => {
          :q => q,
          :fl => fl,
          :rows => rows,
          :sort => sort,
          :start => start
      }
    end
  end
end