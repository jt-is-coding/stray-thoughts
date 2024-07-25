desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  p "Creating sample data"

  if Rails.env.development?
    Note.destroy_all
    Game.destroy_all
    User.destroy_all
  end

  usernames = []
  usernames << "alice"
  usernames << "bob"

  8.times do
    usernames << Faker::Name.first_name
  end

  usernames.each do |username|
    u = User.create(
      email: "#{username}@example.com",
      password: "password",
      username: username.downcase
      )
      p u.errors.full_messages
  end
  p "There are now #{User.count} users"

  20.times do
    game = Faker::Game
    g = Game.create(
      title: game.title,
      description: game.genre,
      image: "/assets/segabits-seganet-limp-bizkit.png",
      platforms: game.platform,
      api_id: rand(1000)
    )
    p g.errors.full_messages
  end
  p "There are now #{Game.count} games"

  users = User.all
  
  users.each do |user|
    rand(1..3).times do
      game = Game.all.sample
      n = Note.create(
        author: user,
        parent: game,
      )
      p n.errors.full_messages
    end
  end
  p "There are now #{Note.count} notes"
end
