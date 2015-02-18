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

  stream.on_inited do
    log.info('init')
  end
  stream.userstream do |status|
    log.info('status from @%s: %s, status reply :%s' % [status.from_user, status.text, status.reply])

    old_status_id               = 0
    mention                     = rest.mentions_timeline.first
    tweet_status_id             = mention.id.to_i
    mention_text                = rest.status(mention.id).text
    reply_to_user               = rest.user.screen_name
    log.info('mention from @%s: %s, status id :%s' % [reply_to_user, mention_text, tweet_status_id])

#    EM.add_timer(rand(5) + 5) do
#      tweet = "@" + reply_to_user + " " + reply_text(reply_to_user, mention_text)
#      rest.update(tweet)
#    end
  end
end
