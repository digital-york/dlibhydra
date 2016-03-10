class DipFileSet < ActiveFedora::Base
  include Hydra::Works::FileSetBehavior

  # this won't contain files, it will contain references to the federated dip

  # change to preflabel
  property :title, predicate: ::RDF::Vocab::DC.title, multiple: false do |index|
    index.as :stored_searchable
  end

  def dip?
    true
  end
  def additional?
    false
  end
end