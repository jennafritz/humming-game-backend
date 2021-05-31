class Application
  def call(env)
    req = Rack::Request.new(env)

    if req.path.match(/hello/)
      send_hello
    elsif req.path.match(/songs/) && req.get?
      send_songs
    elsif req.path.match(/games/) && req.post?
      create_game(req)
      # send_hello
    else
      send_not_found
    end
  end

  private

  def send_hello
    return [200, { "Content-Type" => "application/json" }, [{ :message => "hello world!" }.to_json]]
  end

  def create_game(req)
    game_hash = JSON.parse(req.body.read)
    new_game_instance = Game.create(game_hash)
    return [201, { "Content-Type" => "application/json" }, [new_game_instance.to_json]]
  end

  def send_songs
    song_instance_array = Song.all
    return [200, { "Content-Type" => "application/json" }, [song_instance_array.to_json]]
  end

  def send_not_found
    return [404, {}, ["Path not found!!!"]]
  end
end
