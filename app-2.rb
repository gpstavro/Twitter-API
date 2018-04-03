# require 'rubygems'
# require 'oauth'
# require 'json'



# #parse a response from the API and return a user object

# def parse_user_reponse(response)
#     user = nil
    
#     #Check for a successful request
#     if response.code == '200'
#         #parse the response body, which is in the JSON format
#         #Add code to parse the response body here
        
#         user = JSON.parse(response.body, {:symbolize_names => true})
        
#         #Pretty-print the user object to see what data is available
#         puts "Hello, #{user[:screen_name]}!"
        
#     else
#         #There was an error issuing the request
#         puts "expected a response of 200 but got #{response.code}"
#     end
#     user
# end

# # Print data about a list of tweets
# def print_timeline(tweets)
#     #add code to interate through each tweet and its text
#     tweets.each do |tweet| 
#         puts tweets['text']
#     end
# end

# # Change the following values to those provided on dev.twitter.com
# # The consumer key identifies the application making the request.
# # The access token identifies the user making the request.
# consumer_key = OAuth::Consumer.new(
#     	"xxxxx",
#     "xxxxx")
# access_token = OAuth::Token.new(
#     "xxxxx",
#     "xxxxx")

# # All requests will be sent to this server.
# baseurl = "https://api.twitter.com"
# path    = "/1.1/statuses/user_timeline.json"
# # The verify credentials endpoint returns a 200 status if
# # the request is signed correctly.
# address = URI("#{baseurl}/1.1/account/verify_credentials.json")
# # address = URI("#{baseurl}#{path}?#{query}")

# # Set up Net::HTTP to use SSL, which is required by Twitter.
# http = Net::HTTP.new address.host, address.port
# http.use_ssl = true
# http.verify_mode = OpenSSL::SSL::VERIFY_PEER

# # Build the request and authorize it with OAuth.
# request = Net::HTTP::Get.new address.request_uri
# request.oauth! http, consumer_key, access_token

# # Issue the request and return the response.
# # http.start
# response = http.request request
# puts "The response status was #{response.code}"

# user = parse_user_reponse(response)

# # puts response.body

# # Day two

# # Now you will fetch /1.1/status/show.json, which 
# # takes an 'id' parameter and returns the
# # representation of a single tweet

# path = "/1.1/statuses/show.json"
# # Old Query query = URI.encode_www_form("id" => "266270116780576768")
# # instead of looking for one tweet we are now looking for a timline of five tweets. We shall add ten later
# query = URI.encode_www_form(
#     "screen_name" => "twitterapi",
#     "count" => 5
# )
# address_status = URI("#{baseurl}#{path}#{query}")
# request = Net::HTTP::Get.new address.request_uri

# # print data about a tweet
# def print_tweet(tweet)
#   puts tweet 
# end

# #Issue the request
# request.oauth! http, consumer_key, access_token

# http.start
# response = http.request request

# tweets = nil





# if response.code == '200' then
#     tweets = JSON.parse(response.body)
#     # print_tweet(tweet)
#     print_timeline(tweets)
#     puts "Successfully sent #{tweets["text"]}"
# else
#   puts "Could not send the Tweet! Code:#{response.code} Body:#{response.body}"

# end

#Reading a timeline exercise

require 'rubygems'
require 'oauth'
require 'json'

# Now you will fetch /1.1/statuses/user_timeline.json,
# returns a list of public Tweets from the specified
# account.
baseurl = "https://api.twitter.com"
path    = "/1.1/statuses/user_timeline.json"
query   = URI.encode_www_form(
    "screen_name" => "twitterapi",
    "count" => 10,
)
address = URI("#{baseurl}#{path}?#{query}")
request = Net::HTTP::Get.new address.request_uri

# Print data about a list of Tweets
def print_timeline(tweets)
  # ADD CODE TO ITERATE THROUGH EACH TWEET AND PRINT ITS TEXT
    tweets.each do |tweet|
      puts tweet["text"]
    end
end

# Set up HTTP.
http             = Net::HTTP.new address.host, address.port
http.use_ssl     = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER

# If you entered your credentials in the first
# exercise, no need to enter them again here. The
# ||= operator will only assign these values if
# they are not already set.
consumer_key ||= OAuth::Consumer.new "xxxxx",
    "xxxxx"
access_token ||= OAuth::Token.new "xxxxx",
    "xxxxx"

# Issue the request.
request.oauth! http, consumer_key, access_token
http.start
response = http.request request

# Parse and print the Tweet if the response code was 200
tweets = nil
if response.code == '200' then
  tweets = JSON.parse(response.body)
  print_timeline(tweets)
end
