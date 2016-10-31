module Dlibhydra
  # thesis
  class Thesis < ActiveFedora::Base

    include Dlibhydra::AddWorkBehaviour,
            # Hydra::Works::WorkBehavior,
            # Dlibhydra::AssignId,
            Dlibhydra::AddLabels,
            Dlibhydra::AddDcDescriptive,
            Dlibhydra::DcRights,
            Dlibhydra::DcAbstract,
            Dlibhydra::Doi,
            Dlibhydra::FormerIdentifier,
            Dlibhydra::Orcid,
            Dlibhydra::MainFile,
            Dlibhydra::ThesisMetadata

    type << ::RDF::URI.new('http://purl.org/ontology/bibo/Thesis')

    def thesis?
      true
    end

    # add the preflabel for _resource objects into solr
    class TextIndexer < Hydra::PCDM::PCDMIndexer
      def generate_solr_document
        super.tap do |solr_doc|
          # TODO add facetable
          object.creator_resource.each do |thing|
            solr_doc['creator_value_tesim'] = thing.preflabel
          end
          # object.advisor_resource.each do |thing|
          #   solr_doc['advisor_value_tesim'] = thing.preflabel
          # end
          # object.qualification_level_resource.each do |thing|
          #   solr_doc['qualification_level_value_tesim'] = thing.preflabel
          # end
          # # TODO add facetable
          # object.department_resource.each do |thing|
          #   solr_doc['department_value_tesim'] = thing.preflabel
          # end
          # object.awarding_institution_resource.each do |thing|
          #   solr_doc['awarding_institution_value_tesim'] = thing.preflabel
          # end
          # TODO add facetable
          object.subject_resource.each do |thing|
            solr_doc['subject_value_tesim'] = thing.preflabel
          end
        end
      end
    end

    def self.indexer
      TextIndexer
    end

  end
end
