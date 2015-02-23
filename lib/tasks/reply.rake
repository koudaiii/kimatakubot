require 'logger'
require 'tweetstream'
require 'net/http'
require 'uri'
require 'json'
require 'openssl'

namespace :twitter do
  desc "reply"
  task :reply => :environment do

    log = Logger.new(STDOUT)
    STDOUT.sync = true

    # Twitter Client
    client = Twitter::REST::Client.new do |config|
      config.consumer_key       = ENV['CONSUMER_KEY']
      config.consumer_secret    = ENV['CONSUMER_SECRET']
      config.oauth_token        = ENV['OAUTH_TOKEN']
      config.oauth_token_secret = ENV['OAUTH_TOKEN_SECRET']
    end

    # Twitter userstream
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
      stream.userstream do |status|
        log.info('status from @%s: %s' % [status.from_user, status.text])
      end
    end
#    max_status_id               = 0
#    mention                     = client.mentions_timeline.first
#    tweet_status_id             = mention.id.to_i
#    mention_text                = client.status(mention.id).text
#    reply_to_user               = mention.user.screen_name
#
#    if ( max_status_id < tweet_status_id )
#      max_status_id = tweet_status_id
#    end
#    next if ( last_reply_status_id >= tweet_status_id )   # 既に応答した人はスキップ
#    tweet = "@" + reply_to_user + " " + reply_text(reply_to_user, mention_text)
#    client.update(tweet)
#    update_reply_status_id(max_status_id)
  end

  def reply_text(reply_to_user="",mention_text="")
    apikey = ENV['DOCOMO_API_KEY']
    uri = URI.parse("https://api.apigw.smt.docomo.ne.jp/dialogue/v1/dialogue?APIKEY=#{apikey}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    body = {}
    body['utt'] = mention_text
    body['nickname'] = reply_to_user
    body['t'] = 20
    request = Net::HTTP::Post.new(uri.request_uri, {'Content-Type' =>'application/json'})
    request.body = body.to_json

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
