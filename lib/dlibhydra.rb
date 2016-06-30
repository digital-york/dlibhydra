require "dlibhydra/version"

module Dlibhydra
  extend ActiveSupport::Autoload

  module Vocab
    extend ActiveSupport::Autoload
    eager_autoload do
      autoload :Generic
      autoload :BorthwickRegisters
      autoload :OaisArchivematica
      autoload :PureTerms
      autoload :Uketd
    end
  end

  autoload_under 'models/authorities' do
    autoload :Concept
    autoload :ConceptScheme
    autoload :Group
    autoload :Person
    autoload :Place
    autoload :PurePerson
    autoload :PureOrganisation
  end

  autoload_under 'models/collections' do
    autoload :Collection
  end

  autoload_under 'models/db' do

  end

  autoload_under 'models/files' do

  end

  autoload_under 'models/filesets' do
    autoload :MainFileSet
    autoload :DatasetFileSet
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
    autoload :DcAccessRights
    autoload :DcAvailable
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
    autoload :ValidateConceptScheme
    autoload :ValidateLabel
    autoload :Archivematica
    autoload :Pure
    autoload :Doi
  end

  autoload_under 'validators' do
    autoload :HasLabelValidator
    autoload :ConceptSchemeMemberValidator
  end

end
