shared_examples_for "add_labels" do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str =  model.to_s.split('::')[1]
    @stubby = FactoryGirl.build(model_str.underscore.to_sym, :with_before_save_callback)
    @stubbier = FactoryGirl.build(model_str.underscore.to_sym, :with_before_save_callback,
                                  :title => ['title'], :preflabel => nil)
    @stubbing = FactoryGirl.build(model_str.underscore.to_sym, :with_before_save_callback,
                                  :title => ['title'], :preflabel => 'label')
  end
  it "automatically generates dc.title from preflabel" do
    expect(@stubby.title).to eq(['label'])
  end
  it "automatically generates rdfsLabel from preflabel" do
    expect(@stubby.rdfs_label).to eq('label')
  end
  it "automatically generates preflabel from title" do
    expect(@stubbier.title).to eq(['title'])
  end
  it "automatically generates rdfsLabel from preflabel when title only is supplied" do
    expect(@stubbier.rdfs_label).to eq('title')
  end
  it "automatically generates title from both title and preflabel when both are supplied" do
    expect(@stubbing.title).to eq(['title','label'])
  end
  it "automatically generates rdfsLabel from preflabel when title only is supplied" do
    expect(@stubbing.rdfs_label).to eq('label')
  end
end