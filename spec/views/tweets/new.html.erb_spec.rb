require 'spec_helper'

describe "tweets/new" do
  before(:each) do
    assign(:tweet, stub_model(Tweet,
      :title => "MyString",
      :tweet => "MyText",
      :twitter_acount_name => "MyText"
    ).as_new_record)
  end

  it "renders new tweet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tweets_path, "post" do
      assert_select "input#tweet_title[name=?]", "tweet[title]"
      assert_select "textarea#tweet_tweet[name=?]", "tweet[tweet]"
      assert_select "textarea#tweet_twitter_acount_name[name=?]", "tweet[twitter_acount_name]"
    end
  end
end
