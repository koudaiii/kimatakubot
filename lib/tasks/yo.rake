require 'net/http'

namespace :Yo do
  desc "Yo"
  task :Yo => :environment do
      @api_token       = ENV['YO_API_TOKEN']
  end
  Net::HTTP.post_form(URI('http://api.justyo.co/yoall/'), 'api_token' => @api_token)
end
