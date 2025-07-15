require "faker"

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

admin_pass = Faker::Internet.password(
  min_length: 20,
  max_length: 64,
  mix_case: true,
  special_characters: true,
)
Employee.create(
  email_address: "admin@example.org",
  password: admin_pass,
  password_confirmation: admin_pass,
)
puts "Admin account created, password: #{admin_pass}"

Faker::Config.locale = :nl
classes = %w[Warrior Rogue Mage Priest]

10.times do
  Clan.create(
    name: Faker::Company.name,
    )
end

clans = Clan.all

100.times do
  account = Account.create(
    username: Faker::Twitter.unique.screen_name,
    password_digest: "$2a$12$D.OYMHXfui3TSniccB3SNev4si4UpFN6tb.DqzAS/VGm5MH8RHT5a", # password is "password"
  )

  Player.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email_address: Faker::Internet.unique.email,
    account: account,
    )

  rand(1..8).times do |ii|
    lvl = rand(1..20)
    xp = lvl == 20 ? 0 : rand(0..(500 * lvl))

    character = Character.create(
      name: Faker::Name.unique.first_name,
      class_name: classes.sample,
      level: lvl,
      xp: xp,
      account: account,
      )

    character.clans = clans.sample(rand(0..3))
  end

  Faker::Name.unique.clear
end
