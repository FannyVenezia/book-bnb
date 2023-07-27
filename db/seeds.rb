require 'faker'
require 'open-uri'

puts 'Cleaning database...'

Book.destroy_all
User.destroy_all

puts 'Creating books...'

user1 = User.create(email: 'titi@gmail.com', password: 'tititi', first_name: 'Jean-Loup', last_name: 'Paroug')

book1 = URI.open("https://res.cloudinary.com/dsas0wiz2/image/upload/v1682602473/alpes.jpg")
book2 = URI.open("https://res.cloudinary.com/dsas0wiz2/image/upload/v1671797407/development/car.jpg")

book_1_photos = [
  {io: book1, filename: "alpes.jpg", content_type: "image/jpg"},
  {io: book2, filename: "car.jpg", content_type: "image/jpg"}
]

book_1 = Book.new(
  title: 'Numéro Deux',
  author: 'David Foenkinos',
  genre: 'Real life',
  editor: 'Gallimard',
  published: '20019',
  description: 'Un régal de drôlerie et de philosophie',
  address: '59 Avenue Charles de Gaulle 13140 Miramas',
  user: user1
)
book_1.photos.attach(book_1_photos)
book_1.save

Book.create!(
  title: 'Henri Pick',
  author: 'David Foenkinos',
  genre: 'Real life',
  editor: 'Gallimard',
  published: '20019',
  description: 'Un régal de drôlerie et de philosophie',
  address: '62 Impasse des Floralies 34000 Montpellier',
  user: user1
)

10.times do
  book = Book.new(
    title: Faker::Book.unique.title,
    author: Faker::Book.author,
    genre: Faker::Book.genre,
    editor: Faker::Book.publisher,
    published: Faker::Address.building_number,
    description: Faker::Quote.famous_last_words,
    address: Faker::Address.full_address,
    user: user1
  )
  book.save!
end

puts 'Finished !'
