# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tweet do
    title "MyString"
    tweet "MyText"
    twitter_acount_name "MyText"
    started_at "2014-03-21"
    ended_at "2014-03-21"
  end
end
