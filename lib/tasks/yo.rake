require 'net/http'

namespace :Yo do
  desc "Yo"
  task :Yo => :environment do
    yo_api_token       = ENV['YO_API_TOKEN']
    puts "#{yo_api_token}"
    yoall(yo_api_token)
  end

  def yoall(yo_api_token)
    Net::HTTP.post_form(URI('http://api.justyo.co/yoall/'), 'api_token' => yo_api_token)
  end
end
