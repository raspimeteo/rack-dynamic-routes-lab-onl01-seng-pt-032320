require 'pry'
class Application
  
  attr_accessor :name, :price
  
  @@item = []
	 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      item = Item.new(name, price)
      @@item << item
      for @@item.each do |i|{
        binding.pry
        resp.write "#{i.name} #{i.price}"}
      end
    else 
      return [ 404, {'Content-Type' => 'text/html'}, "Route not found" ]
    end
	 
	    resp.finish
  end
end
