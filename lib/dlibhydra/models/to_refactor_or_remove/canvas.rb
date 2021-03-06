# require 'active_fedora/noid'

class Canvas < ActiveFedora::File
  include ActiveFedora::WithMetadata # ,AssignId

  metadata do
    property :preflabel, predicate: ::RDF::Vocab::SKOS.prefLabel, multiple: false do |index|
      index.as :stored_searchable, :sortable
    end
    configure type: RDF::URI.new('http://pcdm.org/models#File')
    configure type: RDF::URI.new('http://www.shared-canvas.org/ns/Canvas')
  end
end
