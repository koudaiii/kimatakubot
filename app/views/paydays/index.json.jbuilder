json.array!(@paydays) do |payday|
  json.extract! payday, :id, :title, :twitter_acount_name, :payday
  json.url payday_url(payday, format: :json)
end
