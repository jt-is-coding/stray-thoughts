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
end
