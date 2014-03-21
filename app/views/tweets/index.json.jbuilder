json.array!(@tweets) do |tweet|
  json.extract! tweet, :id, :title, :tweet, :twitter_acount_name, :started_at, :ended_at
  json.url tweet_url(tweet, format: :json)
end
