module Dlibhydra
  class Aip < ActiveFedora::Base
    include Hydra::Works::WorkBehavior,
            Dlibhydra::SkosLabels,
            Dlibhydra::AddRdfsLabel,
            Dlibhydra::AddDcTitle,
            Dlibhydra::ValidateLabel,
            Dlibhydra::AssignId,
            Dlibhydra::Archivematica

    has_and_belongs_to_many :has_dip, class_name: 'Dlibhydra::Dip', predicate: ::RDF::SKOS.narrower, inverse_of: :has_aip

    type << Dlibhydra::Vocab::OaisArchivematica.ArchivalInformtionPackage

    # new term
    # from Archivematica
    property :aip_uuid, predicate: Dlibhydra::Vocab::OaisArchivematica.aipUuid, multiple: false do |index|
      index.as :stored_searchable
    end
    property :transfer_uuid, predicate: Dlibhydra::Vocab::OaisArchivematica.aipUuid, multiple: false do |index|
      index.as :stored_searchable
    end
    property :sip_uuid, predicate: Dlibhydra::Vocab::OaisArchivematica.aipUuid, multiple: false do |index|
      index.as :stored_searchable
    end

    property :readme, predicate: Dlibhydra::Vocab::Generic.readme, multiple: false do |index|
      index.as :stored_searchable
    end

    def aip?
      true
    end
    def dip?
      false
    end

  end
end