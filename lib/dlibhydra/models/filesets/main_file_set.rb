class MainFileSet < ActiveFedora::Base
  include Hydra::Works::FileSetBehavior

  # change to preflabel
  property :title, predicate: ::RDF::Vocab::DC.title, multiple: false do |index|
    index.as :stored_searchable
  end

  def main?
    true
  end
  def additional?
    false
  end
end