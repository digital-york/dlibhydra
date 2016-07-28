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
    autoload :ReadmeFileSet
  end

  autoload_under 'models/works' do
    autoload :Aip
    autoload :Dataset
    autoload :GenericWork
    autoload :Thesis
  end

  autoload_under 'models/works/entry' do

  end

  autoload_under 'models/concerns/metadata' do
    # Metadata
    autoload :BorthwickNote
    autoload :FoafName
    autoload :FoafNameParts
    autoload :FormerIdentifier
    autoload :GenericAuthorityTerms
    autoload :GenericQualifier
    autoload :HubDates
    autoload :MadsRelatedAuthority
    autoload :OwlSameAs
    autoload :SkosLabels
    autoload :ThumbnailUrl
    autoload :Archivematica
    autoload :Pure
    autoload :Doi
    autoload :Readme
  end

  autoload_under 'models/concerns/metadata/rdfs' do
    # RDF and RDFS
    autoload :RdfsSeeAlso
    autoload :RdfsLabel
  end

  autoload_under 'models/concerns/metadata/dc' do
    # Dublin Core Metadata
    autoload :DcAccessRights
    autoload :DcAvailable
    autoload :DcKeywordSubject
    autoload :DcRights
    autoload :DcTitle
    autoload :DcIdentifier
    autoload :DcDescription
    autoload :DcDate
    autoload :DcCreator
    autoload :DcAbstract
    autoload :DcLanguage
    autoload :DcResourceType
  end

  autoload_under 'models/concerns/behaviours' do
    # Identifiers
    autoload :AssignId
    # Behaviour
    autoload :AddLabels
    autoload :AddDcDescriptive
    # Validations
    autoload :ValidateConceptScheme
    #autoload :ValidateLabel
  end

  autoload_under 'validators' do
    #autoload :HasLabelValidator
    autoload :ConceptSchemeMemberValidator
  end

end
