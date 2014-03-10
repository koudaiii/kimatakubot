require 'spec_helper'

describe "releases/new" do
  before(:each) do
    assign(:release, stub_model(Release,
      :title => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new release form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", releases_path, "post" do
      assert_select "input#release_title[name=?]", "release[title]"
      assert_select "textarea#release_description[name=?]", "release[description]"
    end
  end
end
