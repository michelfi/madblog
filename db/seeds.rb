
puts "Destroying all users"
User.destroy_all
puts "Destroying all posts"
Post.destroy_all
puts "Destroying all comments"
Comment.destroy_all


puts "Creating a user"
user1 = User.create!(email: "michel.figueres@gmail.com", password: "azerty", avatar: "https://i.ibb.co/qk9cp8w/te-le-chargement-4.jpg", user_type: "admin")
puts "User1 (admin) created !"
user2 = User.create!(email: "janine@gmail.com", password: "azerty", avatar: "https://i.ibb.co/hcC2SHK/te-le-chargement.jpg", user_type: "poster")
puts "User2 (poster) created !"
user3 = User.create!(email: "louisette@gmail.com", password: "azerty", avatar: "https://i.ibb.co/nzMsTTv/te-le-chargement-3.jpg", user_type: "user")
puts "User3 (user) created !"


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


puts "Creating a comment"
comment1 = Comment.create!(content: "Super commentaire !", rating: "1", post_id: post1.id, user_id: user1.id)

puts "Finish!"
