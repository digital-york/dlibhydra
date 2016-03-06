require "dlibhydra/version"

module Dlibhydra
  extend ActiveSupport::Autoload

  module Vocab
    extend ActiveSupport::Autoload
    eager_autoload do
      autoload :Generic
      autoload :BorthwickRegisters
    end
  end

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
