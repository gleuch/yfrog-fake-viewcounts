#!/usr/bin/env ruby


# To run:
# ------------------------------------------------------------------------------
#   url="http://img36.yfrog.com/i/ppj.jpg/" ruby jump.rb
#
#   (where url="--" your yfrog image URL.)


require 'rubygems'
require 'open-uri'
require 'mechanize'

url = ENV['url']
 
puts "Starting famo count on your page: #{url}"
agent = WWW::Mechanize.new
agent.user_agent_alias, agent.read_timeout = "Mac Safari", 30
max, retries, refresh = 500000, 10, 0

while refresh < max
  begin
    page = agent.get(url)
    sleep(1/100.to_f)
    puts "Increase up to #{refresh+1}."
  rescue Exception
    puts "Error fetching: #{$!} #{retries} retries remaining."
    retry if (retries -= 1) > 0
  end
  (refresh += 1) # next count
end

puts "Done increasing your famo count by #{refresh}."
