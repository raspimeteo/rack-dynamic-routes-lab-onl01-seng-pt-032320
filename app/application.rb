class Application
  
  attr_accessor :name, :price
  
  @@item = []
	 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      i = @@item.last
      resp.write "#{i.price}"
    else 
      return [ 404, {'Content-Type' => 'text/html'}, "Route not found" ]
    end
	 
	    resp.finish
  end
end
