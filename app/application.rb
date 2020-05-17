class Application
	 
  @@songs = [Song.new("Sorry", "Justin Bieber"),
            Song.new("Hello","Adele")]
5.	 
6.	  def call(env)
7.	    resp = Rack::Response.new
8.	    req = Rack::Request.new(env)
9.	 
10.	    if req.path.match(/songs/)
11.	 
12.	      song_title = req.path.split("/songs/").last #turn /songs/Sorry into Sorry
13.	      song = @@songs.find{|s| s.title == song_title}
14.	 
15.	      resp.write song.artist
16.	    end
17.	 
18.	    resp.finish
19.	  end
20.	end
