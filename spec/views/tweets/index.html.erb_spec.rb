require 'spec_helper'

describe "tweets/index" do
  before(:each) do
    assign(:tweets, [
      stub_model(Tweet,
        :title => "Title",
        :tweet => "MyText",
        :twitter_acount_name => "MyText"
      ),
      stub_model(Tweet,
        :title => "Title",
        :tweet => "MyText",
        :twitter_acount_name => "MyText"
      )
    ])
  end

  it "renders a list of tweets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
