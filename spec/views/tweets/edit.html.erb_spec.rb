require 'spec_helper'

describe "tweets/edit" do
  before(:each) do
    @tweet = assign(:tweet, stub_model(Tweet,
      :title => "MyString",
      :tweet => "MyText",
      :twitter_acount_name => "MyText"
    ))
  end

  it "renders the edit tweet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tweet_path(@tweet), "post" do
      assert_select "input#tweet_title[name=?]", "tweet[title]"
      assert_select "textarea#tweet_tweet[name=?]", "tweet[tweet]"
      assert_select "textarea#tweet_twitter_acount_name[name=?]", "tweet[twitter_acount_name]"
    end
  end
end
