module Dlibhydra
  class Collection < ActiveFedora::Base
    # TODO check CC Collection Behaviour
    include Hydra::Works::CollectionBehavior, #Hyrax::CollectionBehavior,
            Dlibhydra::AddLabels,
            Dlibhydra::AddDcDescriptive,
            Dlibhydra::DcRights,
            Dlibhydra::DcPublisher,
            Dlibhydra::FormerIdentifier,
            Dlibhydra::AddDefaultPermissions,
            Dlibhydra::CollectionsCategory

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

    class CollectionIndexer < Hyrax::CollectionIndexer # Hydra::PCDM::PCDMIndexer
      include Dlibhydra::IndexesCollection
    end

    def self.indexer
      CollectionIndexer
    end
  end
end
