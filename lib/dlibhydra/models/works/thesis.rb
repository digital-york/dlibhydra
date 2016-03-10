class Thesis < ActiveFedora::Base
  include Hydra::Works::WorkBehavior

  filters_association :members, as: :main, condition: :main?
  filters_association :members, as: :additionals, condition: :additional?

  # UKETD (xml schema, not RDF)
  # some dissertation stuff: http://bibframe.org/vocab-list/
  # Bibo might also have some stuff http://bibliontology.com

  # auto add rdf types (doesn't go into solr)
  # my add_rdf_types is alternative and will go into solr
  type << ::RDF::URI.new('http://purl.org/ontology/bibo/Thesis')
  type << ::RDF::URI.new('http://bibframe.org/vocab-list/#Work')

  property :title, predicate: ::RDF::Vocab::DC.title, multiple: false do |index|
    index.as :stored_searchable
  end
  # author identifier, eg. ORCID
  # would this be a URI?
  property :author, predicate: ::RDF::Vocab::DC.creator, multiple: false do |index|
    index.as :stored_searchable
  end
  property :abstract, predicate: ::RDF::Vocab::DC.abstract, multiple: false do |index|
    index.as :stored_searchable
  end
  property :date_of_award, predicate: ::RDF::Vocab::DC.issued, multiple: false do |index|
    index.as :stored_searchable
  end
  # http://naca.central.cranfield.ac.uk/ethos-oai/terms/advisor
  property :advisor, predicate: ::RDF::URI.new('http://naca.central.cranfield.ac.uk/ethos-oai/terms/advisor'), multiple: true do |index|
    index.as :stored_searchable
  end
  # http://naca.central.cranfield.ac.uk/ethos-oai/terms/department
  property :department, predicate: ::RDF::URI.new('http://naca.central.cranfield.ac.uk/ethos-oai/terms/department'), multiple: true do |index|
    index.as :stored_searchable
  end
  # bibo has issuer
  # http://naca.central.cranfield.ac.uk/ethos-oai/terms/institution
  property :awarding_institution, predicate: ::RDF::Vocab::Bibframe.dissertationInstitution, multiple: false do |index|
    index.as :stored_searchable
  end
  # http://naca.central.cranfield.ac.uk/ethos-oai/terms/qualificationlevel
  property :qualification_level, predicate: ::RDF::URI.new('http://naca.central.cranfield.ac.uk/ethos-oai/terms/qualificationlevel'), multiple: false do |index|
    index.as :stored_searchable
  end
  # http://naca.central.cranfield.ac.uk/ethos-oai/terms/qualificationname
  property :qualification_name, predicate: ::RDF::Vocab::BIBO.degree, multiple: false do |index|
    index.as :stored_searchable
  end
  property :resource_type, predicate: ::RDF::Vocab::DC.type, multiple: false do |index|
    index.as :stored_searchable
  end
  property :language, predicate: ::RDF::Vocab::DC.language, multiple: false do |index|
    index.as :stored_searchable
  end
  # how about using DC11 for keyword and DC for subject?
  property :keyword, predicate: ::RDF::Vocab::DC11.subject, multiple: true do |index|
    index.as :stored_searchable
  end
  property :subject, predicate: ::RDF::Vocab::DC.subject, multiple: true do |index|
    index.as :stored_searchable
  end
  # cc:attributionName
  property :rights_holder, predicate: ::RDF::Vocab::DC.rightsHolder, multiple: false do |index|
    index.as :stored_searchable
  end
  # cc:license
  property :license, predicate: ::RDF::Vocab::DC.license, multiple: false do |index|
    index.as :stored_searchable
  end

  def main?
    false
  end
  def additional?
    false
  end
end