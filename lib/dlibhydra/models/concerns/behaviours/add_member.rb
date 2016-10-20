module Dlibhydra
  # add mandatory datacite elements
  module AddMember
    extend ActiveSupport::Concern

    included do
      # Ensure the FileSet is added to the members
      before_save :add_member

      # TODO remove duplication with main file - this method can be the same
      # Add the FileSet to the members if it has not been added.
      def add_member
        unless self.file_set.empty?
          unless self.members.include? self.file_set.first
            self.members << self.file_set.first
          end
        end
      end
    end
  end
end
