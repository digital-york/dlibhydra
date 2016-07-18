require 'rdf'
module Dlibhydra
  module Vocab
    class OaisArchivematica < RDF::Vocabulary('http://dlib.york.ac.uk/ontologies/oais-archivematica#')

        # Class definitions
        term :DisseminationInformationPackage,
             comment: %(A dissemination information package, as defined by the Reference Model for an Open Archival Information System (OAIS).).freeze,
             label: 'Dissemination Information Package (DIP)'.freeze,
             'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/oais-archivematica#).freeze,
             # TODO subClassOf: ''.freeze,
             type: 'rdfs:Class'.freeze

        term :ArchivalInformationPackage,
             comment: %(An archival information package, as defined by the Reference Model for an Open Archival Information System (OAIS).).freeze,
             label: 'Archival Information Package (AIP)'.freeze,
             'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/oais-archivematica#).freeze,
             # TODO subClassOf: ''.freeze,
             type: 'rdfs:Class'.freeze

        term :SubmissionInformationPackage,
             comment: %(A submission information package, as defined by the Reference Model for an Open Archival Information System (OAIS).).freeze,
             label: 'Submission Information Package (SIP)'.freeze,
             'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/oais-archivematica#).freeze,
             # TODO subClassOf: ''.freeze,
             type: 'rdfs:Class'.freeze

        # Property definitions

        property :aipUuid,
                 comment: %(This property should be used to for the unique identifier for an Archival Information Package (AIP).).freeze,
                 label: 'AIP UUID'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/oais-archivematica#).freeze,
                 type: 'rdf:Property'.freeze
        property :dipUuid,
                 comment: %(This property should be used to for the unique identifier for a Dissemination Information Package (AIP).).freeze,
                 label: 'DIP UUID'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/oais-archivematica#).freeze,
                 type: 'rdf:Property'.freeze
        property :sipUuid,
                 comment: %(This property should be used to for the unique identifier for a Submission Information Package (SIP).).freeze,
                 label: 'SIP UUID'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/oais-archivematica#).freeze,
                 type: 'rdf:Property'.freeze
        property :transferUuid,
                 comment: %(This property should be used to for the unique identifier for a transfer.).freeze,
                 label: 'Transfer UUID'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/oais-archivematica#).freeze,
                 type: 'rdf:Property'.freeze

        property :aipCurrentFullPath,
                 comment: %(This property should be used to for current full path of the AIP.).freeze,
                 label: 'Archivematica AIP Current Full Path'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/oais-archivematica#).freeze,
                 type: 'rdf:Property'.freeze
        property :dipCurrentFullPath,
                 comment: %(This property should be used to for current full path of the DIP.).freeze,
                 label: 'Archivematica DIP Current Full Path'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/oais-archivematica#).freeze,
                 type: 'rdf:Property'.freeze
        property :aipCurrentPath,
                 comment: %(This property should be used to for current path of the DIP.).freeze,
                 label: 'Archivematica AIP Current Full Path'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/oais-archivematica#).freeze,
                 type: 'rdf:Property'.freeze
        property :dipCurrentPath,
                 comment: %(This property should be used to for current path of the DIP.).freeze,
                 label: 'Archivematica DIP Current Full Path'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/oais-archivematica#).freeze,
                 type: 'rdf:Property'.freeze
        property :dipCurrentLocation,
                 comment: %(This property should be used to for current location of the DIP.).freeze,
                 label: 'Archivematica DIP Current Location'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/oais-archivematica#).freeze,
                 type: 'rdf:Property'.freeze
        property :aipCurrentLocation,
                 comment: %(This property should be used to for current location of the AIP.).freeze,
                 label: 'Archivematica AIP Current Location'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/oais-archivematica#).freeze,
                 type: 'rdf:Property'.freeze
        property :originPipeline,
                 comment: %(This property should be used to for the origin pipeline of the AIP or DIP.).freeze,
                 label: 'Archivematica Origin Pipeline'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/oais-archivematica#).freeze,
                 type: 'rdf:Property'.freeze
        property :aipSize,
                 comment: %(This property should be used to for the size of the AIP.).freeze,
                 label: 'Archivematica AIP Size'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/oais-archivematica#).freeze,
                 type: 'rdf:Property'.freeze
        property :dipSize,
                 comment: %(This property should be used to for the size of the DIP.).freeze,
                 label: 'Archivematica DIP Size'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/oais-archivematica#).freeze,
                 type: 'rdf:Property'.freeze
        property :resourceUri,
                 comment: %(This property should be used to for the resource uri of the AIP or DIP.).freeze,
                 label: 'Archivematica Resource URI'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/oais-archivematica#).freeze,
                 type: 'rdf:Property'.freeze
        property :aipStatus,
                 comment: %(This property should be used to for status of the AIP. The value should be taken from a controlled list.).freeze,
                 label: 'AIP Status'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/oais-archivematic#).freeze,
                 type: 'rdf:Property'.freeze
        property :dipStatus,
                 comment: %(This property should be used to for status of the DIP. The value should be taken from a controlled list.).freeze,
                 label: 'DIP Status'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/oais-archivematic#).freeze,
                 type: 'rdf:Property'.freeze

        # Extra definitions
        term :"",
             comment: %(General purpose ontology for York Digital Library.).freeze,
             'dc:modified' => %(2016).freeze, # TODO date
             'dc:publisher' => %(http://dlib.york.ac.uk/).freeze,
             'dc:title' => %(York Digital Library OAIS and Archivematica Ontology).freeze,
             label: 'Generic'.freeze,
             'owl:versionInfo' => %(2016).freeze # TODO date
    end
  end
end