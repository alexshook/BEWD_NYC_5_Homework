require 'rubygems'
require 'twitter'
require 'json'

# Twitter API keys
client = Twitter.configure do |config|
  config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
  config.oauth_token = ENV['TWITTER_OAUTH_TOKEN']
  config.oauth_token_secret = ENV['TWITTER_OAUTH_TOKEN_SECRET']
end

# Asking for parameters for search
puts "Welcome to the Twitter Search App!"
puts "What do you want to search Twitter for?"
search_for = gets.chomp
if search_for.empty?
	puts "No idea? Why not try food, cats or Katy Perry?"
	search_for = gets.chomp
end
puts "That's great! How many results do you want (ex. 5, 10, 50)?"
how_many = gets.chomp.to_i
if how_many < 1
	puts "Please type a number (ex. 5, 10, 50)."
	how_many = gets.chomp.to_i
end
# Letting user know we're searching
puts "We're searching #{how_many} tweets for #{search_for}."
# Search results
result = client.search("#{search_for}", :count => "#{how_many}").statuses
# Working on a fix to show Twitter handles
# but not sure if I found the correct entities/am even using them correctly
# becuase t["screen_name"] doesn't do what the documentation says it does
result.each do |t|
	puts t["text"], t["screen_name"]
end