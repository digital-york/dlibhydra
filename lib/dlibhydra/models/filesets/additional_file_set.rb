class AdditionalFileSet < ActiveFedora::Base
  include Hydra::Works::FileSetBehavior

  property :title, predicate: ::RDF::Vocab::DC.title, multiple: false do |index|
    index.as :stored_searchable
  end

  def main?
    false
  end
  def dip?
    false
  end
  def additional?
    true
  end
end