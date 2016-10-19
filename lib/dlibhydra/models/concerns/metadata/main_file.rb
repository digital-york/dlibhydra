module Dlibhydra
  # main file
  module MainFile
    extend ActiveSupport::Concern

    included do
      # Use for the the link to the main file,
      # ie. the deposited thesis PDF and not any associated files
      # Although multiple links *could* be added, add only one.
      has_and_belongs_to_many :hasMainFile, predicate: Dlibhydra::Vocab::Generic.hasMainFile
                              # class_name: 'Dlibhydra::FileSet',
      # An alternative approach is a dedicated FileSet.
      # Currently Curation Concerns only allow a single FileSet.
      # filters_association :members, as: :main, condition: :main?
    end
    
    # Add the FileSet to the members if it has not been added.
    def add_member
      unless self.hasMainFile
        unless self.members and self.members.include? self.hasMainFile.first
          self.members << self.hasMainFile.first
        end
      end
    end
  end
end
