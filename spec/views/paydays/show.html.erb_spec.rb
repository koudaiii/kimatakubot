require 'spec_helper'

describe "paydays/show" do
  before(:each) do
    @payday = assign(:payday, stub_model(Payday,
      :title => "Title",
      :twitter_acount_name => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end
