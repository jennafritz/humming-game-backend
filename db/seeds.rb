puts "Deleting seeds! 🗑"
# Song.destroy_all
User.destroy_all

puts "Creating seeds! 🌸"
User.create(username: "sean")
User.create(username: "katie")
User.create(username: "jenna")

puts "Done creating seeds ✅"
