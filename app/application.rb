class Application
	 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      item_info = req.path.split("/songs/").last #turn /songs/Sorry into Sorry
      item = @@songs.find{|s| s.title == song_title}
      resp.write item_info
    end
	 
	    resp.finish
  end
end
