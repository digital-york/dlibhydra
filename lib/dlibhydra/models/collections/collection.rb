module Dlibhydra
  class Collection < ActiveFedora::Base
    # TODO check CC Collection Behaviour
    include CurationConcerns::CollectionBehavior, #Hydra::Works::CollectionBehavior,
            Dlibhydra::AddLabels,
            Dlibhydra::AddDcDescriptive,
            Dlibhydra::DcRights,
            Dlibhydra::DcPublisher,
            Dlibhydra::FormerIdentifier

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
    def edit_groups
      ['admin']
    end

    # don't know what this is for but I got an error in my tests without it
    def suppressed?
      false
    end

    class CollectionIndexer < CurationConcerns::WorkIndexer # Hydra::PCDM::PCDMIndexer
      include Dlibhydra::IndexesCollection
    end

    def self.indexer
      CollectionIndexer
    end
  end
end
