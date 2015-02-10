# greeter.rb

class Greeter
  def greet
    "hello I'm greeting you"
  end

  def quote tag
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

  quotes[tag.to_sym]
  [
    "<h2>Quotes matching tag: '#{tag}'</h2>",
    "<ul>"
  ].concat( #concat another array(arrays can be concated to arrays)
    quotes[tag.to_sym].sample(1) do |quote| #for each quote you're doing x(
      #by mapping, which returns an array)
      "<li><h3>#{quote}</h3></li>" # quote gets interpolated into ...
      #
    end
  ).push("</ul>")
  end
end
# app.rb


# before filter
# before do
#   @greeter = Greeter.new
# end

# # our application's routes
# get '/hi' do
#   @greeter.greet
# end

# # return quotes matching a tag
# get '/quote/:tag' do
#   raise "tag must not be anything but 'life'" if params[:tag] != 'life'
#   @greeter.quote params[:tag]
# end

# # default /quote route
# get '/quote' do
#   @greeter.quote
# end