require "dlibhydra/version"

module Dlibhydra

  autoload_under 'models' do
    autoload :Concept
    autoload :ConceptScheme
  end

  autoload_under 'models/concerns' do
    autoload :AssignId
    autoload :AssignRdfTypes
    autoload :DcTerms
    autoload :Generic
    autoload :RdfType
    autoload :SameAs
    autoload :SkosLabels
  end

end
