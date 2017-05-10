require 'spec_helper'
require 'active_fedora'
require 'hydra/works'
require 'action_view'

describe Dlibhydra::JournalArticle do
  let(:journal) { FactoryGirl.build(:journal_article) }

  it 'is a journal article' do
    expect(journal.journal_article?).to be_truthy
  end

  # Concerns
#  it_behaves_like 'part_of'
  it_behaves_like 'issue_number'
  it_behaves_like 'volume_number'
  it_behaves_like 'pagination'
  it_behaves_like 'dc_date'

  describe 'metadata' do
    specify { journal.type.should include('http://purl.org/spar/fabio/JournalArticle') }
  end

  describe '#predicates' do
    # none
  end

end
