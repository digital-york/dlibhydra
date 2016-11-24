module Dlibhydra
  class Collection < ActiveFedora::Base
    # TODO check CC Collection Behaviour
    include CurationConcerns::CollectionBehavior, #Hydra::Works::CollectionBehavior,
            Dlibhydra::AddLabels,
            Dlibhydra::AddDcDescriptive,
            Dlibhydra::DcRights,
            Dlibhydra::DcPublisher

    def authority?
      false
    end
    def work?
      false
    end
    def file_set?
      false
    end
    def collection?
      true
    end

    class CollectionIndexer < CurationConcerns::WorkIndexer # Hydra::PCDM::PCDMIndexer
      include Dlibhydra::IndexesCollection
    end

    def self.indexer
      CollectionIndexer
    end
  end
end
