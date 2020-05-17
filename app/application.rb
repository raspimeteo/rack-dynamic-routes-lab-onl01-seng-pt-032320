class Application
	 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      item_info = req.path.split("/songs/").last #turn /songs/Sorry into Sorry
      item = Item.new
      resp.write "#{item.name} #{item.price}"
    end
	 
	    resp.finish
  end
end
