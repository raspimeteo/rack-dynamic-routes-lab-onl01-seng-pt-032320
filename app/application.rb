class Application
  
  attr_accessor :name, :price
  
  @@item = []
	 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      # puts "item_name = #{item_name}"
      item = @@items.detect { |i| i.name == item_name }
      iterm_term = req.params["q"]
      puts iterm_term
      puts name
      puts price
      @@item << Item.new(name, price)
      i = @@item.last
      puts @@item
      puts i.price
      resp.write "#{i.price}"
    else 
      return [ 404, {'Content-Type' => 'text/html'}, "Route not found" ]
    end
	 
	    resp.finish
  end
end
