require 'spec_helper'

describe "paydays/edit" do
  before(:each) do
    @payday = assign(:payday, stub_model(Payday,
      :title => "MyString",
      :twitter_acount_name => "MyText"
    ))
  end

  it "renders the edit payday form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", payday_path(@payday), "post" do
      assert_select "input#payday_title[name=?]", "payday[title]"
      assert_select "textarea#payday_twitter_acount_name[name=?]", "payday[twitter_acount_name]"
    end
  end
end
