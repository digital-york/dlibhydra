module Dlibhydra
  class Package < ActiveFedora::Base
    include Hydra::Works::WorkBehavior,
            Dlibhydra::AddLabels,
            Dlibhydra::AssignId,
            Dlibhydra::Archivematica,
            Dlibhydra::Readme

    # TODO change to a generic package type
    type << Dlibhydra::Vocab::OaisArchivematica.ArchivalInformtionPackage

    before_save :add_dip_type
    before_save :add_aip_type

    # TODO this is temporary
    property :first_requestor, predicate: ::RDF::URI.new('http://example.com/firstRequestor'), multiple: false do |index|
      index.as :stored_searchable
    end

    def package?
      true
    end
    def aip?
      unless self.aip_uuid.nil?
        true
      else
        false
      end
    end
    def dip?
      unless self.dip_uuid.nil?
        true
      else
        false
      end
    end

    # If a DIP has been created, add the rdf type
    def add_dip_type
      unless self.dip_uuid nil?
        type << Dlibhydra::Vocab::OaisArchivematica.DisseminationInformtionPackage
      end
    end

    # If a AIP has been created, add the rdf type
    def add_aip_type
      unless self.aip_uuid nil?
        type << Dlibhydra::Vocab::OaisArchivematica.ArchivalInformtionPackage
      end
    end

  end
end