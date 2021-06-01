puts "Deleting seeds! 🗑"
User.destroy_all

puts "Creating seeds! 🌸"
User.create(
    username: "sean",
    password: "sean"
)
User.create(
    username: "katie",
    password: "katie"
)
User.create(
    username: "jenna",
    password: "jenna"
)

puts "Done creating seeds ✅"
