module Dlibhydra
  # DC creator
  module DcCreator
    extend ActiveSupport::Concern

    included do
      before_save :add_creator_label
      has_and_belongs_to_many :creator_object,
                              class_name: 'Dlibhydra::CurrentPerson',
                              predicate: ::RDF::Vocab::DC.creator

      property :creator, predicate: ::RDF::Vocab::DC11.creator,
               multiple: true do |index|
        index.as :stored_searchable, :sortable
      end

      def add_creator_label
        creator_object.each do | creator_obj |
          self.creator << creator_obj.preflabel
        end
      end
    end
  end
end
