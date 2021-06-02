puts "Deleting seeds! 🗑"
User.destroy_all

puts "Creating seeds! 🌸"
User.create(
    username: "s",
    password: "s",
    point: 0
)
User.create(
    username: "k",
    password: "k",
    point: 0
)
User.create(
    username: "j",
    password: "j",
    point: 0
)

puts "Done creating seeds ✅"
