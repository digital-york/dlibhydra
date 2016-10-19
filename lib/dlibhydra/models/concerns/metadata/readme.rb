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
                                predicate: Dlibhydra::Vocab::Generic.hasReadmeFile
        # An alternative approach is a dedicated FileSet.
        # Currently Curation Concerns only allow a single FileSet.
        # filters_association :members, as: :readme, condition: :readme?

        # Ensure the main flle FileSet is added to the members
        # TODO add member stuff
      end
    end
  end
end
