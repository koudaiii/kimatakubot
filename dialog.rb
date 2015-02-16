#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'logger'
require 'tweetstream'
require 'uri'
require 'json'
require 'openssl'

log = Logger.new(STDOUT)
STDOUT.sync = true

#REST API
rest = Twitter::Client.new(
    :consumer_key       => ENV['CONSUMER_KEY']
    :consumer_secret    => ENV['CONSUMER_SECRET']
    :oauth_token        => ENV['OAUTH_TOKEN']
    :oauth_token_secret => ENV['OAUTH_TOKEN_SECRET']
)

old_status_id               = 0
new_status_id               = 0
mention                     = client.mentions_timeline.first
tweet_status_id             = mention.id.to_i
mention_text                = client.status(mention.id).text
reply_to_user               = mention.user.screen_name

# Streaming API
TweetStream.configure do |config|
  config.consumer_key       = ENV['CONSUMER_KEY']
  config.consumer_secret    = ENV['CONSUMER_SECRET']
  config.oauth_token        = ENV['OAUTH_TOKEN']
  config.oauth_token_secret = ENV['OAUTH_TOKEN_SECRET']
  config.auth_method        = :oauth
end

stream = TweetStream::Client.new
EM.error_handler do |e|
    raise e.message
end
EM.run do

if ( old_status_id < tweet_status_id )
  d_status_ir = tweet_status_id
en
ne if ( last_reply_status_id >= tweet_status_id )   # 既に応答した人はスキップ
twt = "@" + reply_to_user + " " + reply_text(reply_to_user, mention_text)
clnt.update(tweet)
upte_reply_status_id(max_status_id)



dereply_text(reply_to_user="",mention_text="")
  ikey = ENV['DOCOMO_API_KEY']
  i = URI.parse("https://api.apigw.smt.docomo.ne.jp/dialogue/v1/dialogue?APIKEY=#{apikey}")
  tp = Net::HTTP.new(uri.host, uri.port)
  tp.use_ssl = true
  dy = {}
  dy['utt'] = mention_text
  dy['nickname'] = reply_to_user
  dy['t'] = 20
  quest = Net::HTTP::Post.new(uri.request_uri, {'Content-Type' =>'application/json'})
  quest.body = body.to_json

  response = nil
  resp = http.request(request)
  response = JSON.parse(resp.body)
  return response['utt']
end

def update(tweet)
  begin
    tweet = (tweet.length > 140) ? tweet[0..139].to_s : tweet
    Twitter.update(tweet.chomp)
  rescue => e
    Rails.logger.error "<<twitter.rake::tweet.update ERROR : #{e.message}>>"
  end
end

def last_reply_status_id
  file_handle = open( "laststatus.txt" , "r")
  last_status_id = file_handle.gets.to_i
  file_handle.close
  return last_status_id
end

def update_reply_status_id(max_status_id="")
  file_handle = File.open( "laststatus.txt" , "w")
  file_handle.puts max_status_id
  file_handle.close
end
end
