require 'spec_helper'

describe "releases/edit" do
  before(:each) do
    @release = assign(:release, stub_model(Release,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit release form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", release_path(@release), "post" do
      assert_select "input#release_title[name=?]", "release[title]"
      assert_select "textarea#release_description[name=?]", "release[description]"
    end
  end
end
