require "faker"

Employee.create(
  email_address: "admin@example.org",
  password_digest: "$2a$12$6aPNhsyGxYsdxgUYginQCuyRK6.DXgBr.lGxd3SOmKyr1NcNFBD7q",
)

Faker::Config.locale = :nl
classes = %w[warrior rogue mage priest]

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
