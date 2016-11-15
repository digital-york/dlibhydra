module Dlibhydra
  class Package < Work
    include Dlibhydra::AddPackageMetadata

    type << Dlibhydra::Vocab::Generic.Package

    before_save :add_types

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

    # If DIP/AIP has been created, add the rdf type
    def add_types
      unless dip_uuid.nil?
        rdf_type << Dlibhydra::Vocab::OaisArchivematica.DisseminationInformationPackage
      end
      unless aip_uuid.nil?
        rdf_type << Dlibhydra::Vocab::OaisArchivematica.ArchivalInformationPackage
      end
    end
  end
end
