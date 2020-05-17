class Application
  
  attr_accessor :name, :price
  
  @@item = []
	 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      item_info = req.path.split("/songs/").last #turn /songs/Sorry into Sorry
      item = Item.new(name, price)
      @@item << item
      resp.write "#{@@item.name} #{@@item.price}"
    else 
      return [ 404, {'Content-Type' => 'text/html'}, "Route not found" ]
    end
	 
	    resp.finish
  end
end
