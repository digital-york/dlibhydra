module Dlibhydra
  # main file
  module MainFile
    extend ActiveSupport::Concern

    included do
      # Use for the the link to the main file,
      # ie. the deposited thesis PDF and not any associated files
      # Although multiple links *could* be added, add only one.
      has_and_belongs_to_many :mainfile,
                              class_name: 'Dlibhydra::FileSet',
                              predicate: Dlibhydra::Vocab::Generic.mainFile
      # An alternative approach is a dedicated FileSet.
      # Currently Curation Concerns only allow a single FileSet.
      # filters_association :members, as: :main, condition: :main?

      # Ensure the FileSet is added to the members
      before_save :add_member

      # TODO remove duplication with main file - this method can be the same
      # Add the FileSet to the members if it has not been added.
      def add_member
        unless self.mainfile.empty?
          unless self.members.include? self.mainfile.first
            self.members << self.mainfile.first
          end
        end
      end
    end

  end
end
