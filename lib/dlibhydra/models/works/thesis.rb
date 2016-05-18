class Thesis < ActiveFedora::Base
  include Hydra::Works::WorkBehavior,
          Dlibhydra::SkosLabels,
          Dlibhydra::AddRdfsLabel,
          Dlibhydra::AddDcTitle,
          Dlibhydra::ValidateLabel

  filters_association :members, as: :main, condition: :main?
  # TODO change this to an object, call it what? GenericWork? or don't bother?
  filters_association :members, as: :additionals, condition: :additional?

  # auto add rdf types (doesn't go into solr)
  # my add_rdf_types is alternative and will go into solr
  type << ::RDF::URI.new('http://purl.org/ontology/bibo/Thesis')
  type << ::RDF::URI.new('http://bibframe.org/vocab-list/#Work')

  # author identifier, eg. ORCID
  # would this be a URI?
  property :author, predicate: ::RDF::Vocab::DC.creator, multiple: false do |index|
    index.as :stored_searchable
  end
  property :abstract, predicate: ::RDF::Vocab::DC.abstract, multiple: false do |index|
    index.as :stored_searchable
  end
  # or dcterms:dateAccepted (date of award); UKETD uses issued for date on coversheet (date of submission)
  property :date_of_award, predicate: ::RDF::Vocab::DC.issued, multiple: false do |index|
    index.as :stored_searchable
  end
  property :advisor, predicate: Dlibhydra::Vocab::Uketd.advisor, multiple: true do |index|
    index.as :stored_searchable
  end
  property :department, predicate: Dlibhydra::Vocab::Uketd.department, multiple: true do |index|
    index.as :stored_searchable
  end
  # bibo has issuer
  # http://naca.central.cranfield.ac.uk/ethos-oai/terms/institution
  property :awarding_institution, predicate: ::RDF::Vocab::Bibframe.dissertationInstitution, multiple: false do |index|
    index.as :stored_searchable
  end
  property :qualification_level, predicate: Dlibhydra::Vocab::Uketd.qualificationlevel, multiple: false do |index|
    index.as :stored_searchable
  end
  # http://naca.central.cranfield.ac.uk/ethos-oai/terms/qualificationname
  property :qualification_name, predicate: ::RDF::URI.new('http://vivoweb.org/ontology/core#AcademicDegree'), multiple: false do |index|
    index.as :stored_searchable
  end
  property :resource_type, predicate: ::RDF::Vocab::DC.type, multiple: false do |index|
    index.as :stored_searchable
  end
  property :language, predicate: ::RDF::Vocab::DC.language, multiple: false do |index|
    index.as :stored_searchable
  end
  # how about using DC11 for keyword and DC for subject? (uketd adds xsi:type="dcterms:DDC" to subject)
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
