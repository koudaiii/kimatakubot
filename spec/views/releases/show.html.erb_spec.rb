require 'spec_helper'

describe "releases/show" do
  before(:each) do
    @release = assign(:release, stub_model(Release,
      :title => "Title",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end
