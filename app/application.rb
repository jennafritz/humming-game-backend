require 'pry'

class Application
  def call(env)
    req = Rack::Request.new(env)

    if req.path.match(/hello/)
      send_hello
    elsif req.path.match(/songs/) && req.get?
      send_songs
    elsif req.path.match(/games/) && req.post?
      create_game(req)
    elsif req.path.match(/users/) && req.get?
      username_search = req.params["username"]
      password_search = req.params["password"]
      searched_user = User.all.find do |user_instance|
        user_instance.username == username_search && user_instance.password == password_search
      end
      if searched_user
        return [201, {"Content-Type" => "application/json"}, [searched_user.to_json]]
      else
        return [201, {"Content-Type" => "application/json"}, [{ :message => "User does not exist" }.to_json]]
      end
    elsif req.path.match(/users/) && req.post?
      create_user(req)
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
    binding.pry
    return [201, { "Content-Type" => "application/json" }, [new_game_instance.to_json]]
  end

  def create_user(req)
    user_hash = JSON.parse(req.body.read)
    new_user_instance = User.create(user_hash)
    return [201, { "Content-Type" => "application/json" }, [new_user_instance.to_json]]
  end

  def send_songs
    song_instance_array = Song.all
    return [200, { "Content-Type" => "application/json" }, [song_instance_array.to_json]]
  end

  def send_not_found
    return [404, {}, ["Path not found!!!"]]
  end

  def send_users
    User.all
  end
end