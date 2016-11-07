module Dlibhydra

  module FileSetBehavior
    extend ActiveSupport::Concern

#puts 'within /dlibhydra/models/concerns/behaviours/file_set_behavior.rb'

    included do
      def self.type_validator
        Hydra::PCDM::Validators::CompositeValidator.new(
          Hydra::Works::NotCollectionValidator,
          super
        )
      end
      include Hydra::PCDM::ObjectBehavior
      include Hydra::Works::ContainedFiles
#      include Hydra::Works::Derivatives
      include Dlibhydra::Derivatives
      include Hydra::Works::MimeTypes
      include Hydra::Works::VersionedContent
      before_destroy :remove_from_works

      type [Hydra::PCDM::Vocab::PCDMTerms.Object, Vocab::WorksTerms.FileSet]
    end

    def collection?
      false
    end

    def work?
      false
    end

    # @return [Boolean] whether this instance is a Hydra::Works::FileSet.
    def file_set?
      true
    end

    def in_works
      ordered_by.select { |parent| parent.class.included_modules.include?(Hydra::Works::WorkBehavior) }.to_a
    end

    private

      def remove_from_works
        in_works.each do |parent|
          parent.ordered_members.delete(self) # Delete the list node
          parent.members.delete(self) # Delete the indirect container Proxy
          parent.save! # record the changes to the ordered members
        end
      end

  end

end
