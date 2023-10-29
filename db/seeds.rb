
puts "Destroying all users"
User.destroy_all
puts "Destroying all posts"
Post.destroy_all

puts "Creating a user"
user1 = User.create!(email: "michel.figueres@gmail.com", password: "azerty", user_type: "admin")
user1.avatar.attach(io: File.open("storage/te-le-chargement-4.jpeg"), filename: "avatar1.jpg")
puts "User1 (admin) created!"

user2 = User.create!(email: "janine@gmail.com", password: "azerty", user_type: "poster")
user2.avatar.attach(io: File.open("storage/te-le-chargement.jpeg"), filename: "avatar2.jpg")
puts "User2 (poster) created!"

user3 = User.create!(email: "louisette@gmail.com", password: "azerty", user_type: "user")
user3.avatar.attach(io: File.open("storage/te-le-chargement-3.jpeg"), filename: "avatar3.jpg")
puts "User3 (user) created!"


puts "Creating a post"
post1 = Post.create!(title: "Le titre du post", category: "La catégorie du post", content: "Le contenu du post", user_id: user1.id)
post1.image.attach(io: File.open("storage/road-1072821_1280.jpeg"), filename: "nom_de_l_image1.jpg")
puts "Post1 created !"

post2 = Post.create!(title: "Le titre du post", category: "La catégorie du post", content: "Le contenu du post", user_id: user2.id)
post2.image.attach(io: File.open("storage/road-1072823_1280.jpeg"), filename: "nom_de_l_image2.jpg")
puts "Post2 created!"


post3 = Post.create!(title: "Le titre du post", category: "La catégorie du post", content: "Le contenu du post", user_id: user3.id)
post3.image.attach(io: File.open("storage/tree-736885_1280.jpeg"), filename: "nom_de_l_image3.jpg")
puts "Post3 created !"

puts "Finish!"
