module Dlibhydra
  # main file
  module MainFile
    extend ActiveSupport::Concern

    included do
      # Use for the the link to the main file,
      # ie. the deposited thesis PDF and not any associated files
      # Although multiple links *could* be added, add only one.
      has_and_belongs_to_many :file_set,
                              class_name: 'Dlibhydra::FileSet',
                              predicate: Dlibhydra::Vocab::Generic.mainFile
      # An alternative approach is a dedicated FileSet.
      # Currently Curation Concerns only allow a single FileSet.
      # filters_association :members, as: :main, condition: :main?
    end

  end
end
