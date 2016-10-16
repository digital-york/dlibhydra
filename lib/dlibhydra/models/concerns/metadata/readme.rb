module Dlibhydra
  # readme text or readme file
  module Readme
    extend ActiveSupport::Concern

    included do
      property :readme, predicate: Dlibhydra::Vocab::Generic.readme,
               multiple: false do |index|
        index.as :stored_searchable

        # Use for the the link to a readme file
        has_and_belongs_to_many :readmeFile,
                                class_name: 'Dlibhydra::FileSet',
                                predicate: Dlibhydra::Vocab::Generic.hasreadmeFile
        # An alternative approach is a dedicated FileSet.
        # Currently Curation Concerns only allow a single FileSet.
        # filters_association :members, as: :readme, condition: :readme?

        # Ensure the main flle FileSet is added to the members
        before_save :add_member
      end

      # Add the FileSet to the members if it has not been added.
      def add_member
        unless self.mainFile
          unless self.members and self.members.include? self.readmeFile.first
            self.members << self.readmeFile.first
          end
        end
      end
    end
  end
end
