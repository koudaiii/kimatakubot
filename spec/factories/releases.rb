# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :release do
    title "MyString"
    description "MyText"
    release_at "2014-03-10"
  end
end
