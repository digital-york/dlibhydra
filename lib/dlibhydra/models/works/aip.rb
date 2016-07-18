module Dlibhydra
  class Aip < ActiveFedora::Base
    include Hydra::Works::WorkBehavior,
            Dlibhydra::AddLabels,
            Dlibhydra::AssignId,
            Dlibhydra::Archivematica,
            Dlibhydra::Readme

    type << Dlibhydra::Vocab::OaisArchivematica.ArchivalInformtionPackage

    before_save :add_dip_type

    # TODO this is temporary
    property :first_requestor, predicate: ::RDF::URI.new('http://example.com/firstRequestor'), multiple: false do |index|
      index.as :stored_searchable
    end

    def aip?
      true
    end

    # If a DIP has been created, add the rdf type
    def add_dip_type
      if self.dip_status == 'UPLOADED'
        type << Dlibhydra::Vocab::OaisArchivematica.DisseminationInformtionPackage
      end
    end

  end
end