require 'twitter'
require 'sudden_death'

namespace :test do
  desc "tweet"
  task :tweet => :environment do

    date=DateTime.now
    client = Twitter::REST::Client.new do |config|
      config.consumer_key       = ENV['CONSUMER_KEY']
      config.consumer_secret    = ENV['CONSUMER_SECRET']
      config.oauth_token        = ENV['OAUTH_TOKEN']
      config.oauth_token_secret = ENV['OAUTH_TOKEN_SECRET']
    end
    tweet = "Setting Job Schedule in Heroku 4".sudden_death
    unless Payday.find_by_payday("#{date.year}-#{date.month}-#{date.day}").nil?
      client.update(tweet)
    end
  end

  def update(tweet)
    begin
      tweet = (tweet.length > 140) ? tweet[0..139].to_s : tweet
      Twitter.update(tweet.chomp)
    rescue => e
      Rails.logger.error "<<twitter.rake::tweet.update ERROR : #{e.message}>>"
    end
  end
end
