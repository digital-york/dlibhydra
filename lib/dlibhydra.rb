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

  autoload :ConceptSchemeMemberValidator

  autoload_under 'models/authorities' do
    autoload :Concept
    autoload :ConceptScheme
    autoload :Group
    autoload :Person
    autoload :Place
  end

  autoload_under 'models/collections' do


  end

  autoload_under 'models/db' do

  end

  autoload_under 'models/files' do

  end

  autoload_under 'models/filesets' do
    autoload :MainFileSet
  end

  autoload_under 'models/works' do
    autoload :Aip
    autoload :Dataset
    autoload :Dip
    autoload :GenericWork
    autoload :Thesis
  end

  autoload_under 'models/works/entry' do

  end

  autoload_under 'models/concerns' do
    autoload :AddDcTitle
    autoload :AddRdfsLabel
    autoload :AssignId
    autoload :DcKeywordSubject
    autoload :DcRights
    autoload :DcTerms
    autoload :FormerIdentifier
    autoload :GenericAuthorityTerms
    autoload :MadsRelatedAuthority
    autoload :RdfsSeeAlso
    autoload :SameAs
    autoload :SkosLabels
    autoload :ThumbnailUrl
    #autoload :ValidateConceptScheme
    autoload :ValidateLabel
  end

  autoload_under 'validators' do
    autoload :HasLabelValidator
    #autoload :ConceptSchemeMemberValidator
  end

end
