module Dlibhydra
  class Package < ActiveFedora::Base
    include Hydra::Works::WorkBehavior,
            Dlibhydra::AddLabels,
            Dlibhydra::AssignId,
            Dlibhydra::Archivematica,
            Dlibhydra::ReadmeFile,
            Dlibhydra::SimpleVersions

    type << Dlibhydra::Vocab::Generic.Package

    before_save :add_dip_type
    before_save :add_aip_type

    property :requestor_email, predicate: Dlibhydra::Vocab::Generic.requestorEmail, multiple: true do |index|
      index.as :stored_searchable
    end

    def package?
      true
    end

    def aip?
      if aip_uuid.nil?
        false
      else
        true
      end
    end

    def dip?
      if dip_uuid.nil?
        false
      else
        true
      end
    end

    # If DIP has been created, add the rdf type
    def add_dip_type
      unless dip_uuid.nil?
        type << Dlibhydra::Vocab::OaisArchivematica.DisseminationInformtionPackage
      end
    end

    # If AIP has been created, add the rdf type
    def add_aip_type
      unless aip_uuid.nil?
        type << Dlibhydra::Vocab::OaisArchivematica.ArchivalInformtionPackage
      end
    end
  end
end
