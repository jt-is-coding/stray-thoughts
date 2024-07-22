desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  p "Creating sample data"

  if Rails.env.development?
    Note.destroy_all
    Game.destroy_all
    User.destroy_all
  end

  10.times do
    name = Faker::Name.first_name
    u = User.create(
      email: "#{name}@example.com",
      password: "password",
      username: name
      )
      p u.errors.full_messages
  end
  p "There are now #{User.count} users"

  20.times do
    game = Faker::Game
    g = Game.create(
      title: game.title,
      description: game.genre,
      image: "sample",
      platforms: game.platform,
      api_id: rand(1000)
    )
    p g.errors.full_messages
  end
  p "There are now #{Game.count} games"

  5.times do
    game = Game.all.sample
    n = Note.create(
      author: User.all.sample,
      parent: game,
      title: game.title,
      description: game.description,
      platforms: game.platforms,
      image: game.image,
      body: Faker::JapaneseMedia::StudioGhibli.quote
    )
    p n.errors.full_messages
  end
  p "There are now #{Note.count} notes"
end
