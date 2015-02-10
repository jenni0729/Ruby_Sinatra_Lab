require 'sinatra'
require 'sinatra/reloader'
require "better_errors"
require './greeter'

# before filter
before do 
  @greeter = Greeter.new
end

# our application's routes
get '/hi' do
  @greeter.greet
end

# return quotes matching a tag
get '/quote/:tag' do
  #raise "tag must not be anything but 'life'" if params[:tag] != 'life'
  @greeter.quote params[:tag]
end

# default /quote route

#our application's routes
=begin get '/hi' do
  "Hello, I am Jenni!"
end


#raising an error if the tag isn't 'life'
get '/quote/:tag' do
  raise "tag must not be anything but 'life' " if params[:tag] != 'life'
  "You've requested a quote for tag: '#{params[:tag]}'"
end

get '/quote' do
  "The best is yet to come and won't that be fine."
end
 

get '/quotes/:tag' do
quotes = {
    :love => ["love blah blah", "second thing"],
    :alcohol => ["alchol blah", "third thing"],
    :random => ["random blah", "fourth thing"]
  }

  quotes[params[:tag].to_sym]
end


get '/quote/:tag' do
  [
    "<h2>Quotes matching tag: '#{params[:tag]}' </h3>",
    "<ul>",
      "<li><h3>quote1</h3></li>",
      "<li><h3>quote2</h3></li>",
    "</ul>"
  ]
end

my_hash = {}

# return quotes matching a tag
=begin get '/quote/:tag' do
  quotes = {
    :life => [
      "The best is yet to come.",
      "The best revenge is massive success."
    ],
    :love => [
      "....A simple I love you means more than money....",
      "For nobody else, gave me thrill-with all your faults, I love you still. It had to be you, wonderful you, it had to be you."
    ]
  }

  [
    "<h2>Quotes matching tag: '#{params[:tag]}'</h2>",
    "<ul>"
  ].concat( #concat another array(arrays can be concated to arrays)
    quotes[params[:tag].to_sym].map do |quote| #for each quote you're doing x(
      #by mapping, which returns an array)
      "<li><h3>#{quote}</h3></li>" # quote gets interpolated into ...
      #
    end
  ).push("</ul>")
end
=end
