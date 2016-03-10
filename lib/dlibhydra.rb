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

  autoload_under 'models/authorities' do
    autoload :Concept
    autoload :ConceptScheme
  end

  autoload_under 'models/works' do

  end

  autoload_under 'models/entry' do

  end

  autoload_under 'models/filesets' do

  end

  autoload_under 'models/db' do

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
