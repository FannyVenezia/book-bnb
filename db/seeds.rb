require 'faker'

puts 'Cleaning database...'

Book.destroy_all

puts 'Creating books...'

Book.create!(
  title: 'Numéro Deux',
  author: 'David Foenkinos',
  genre: 'Real life',
  editor: 'Gallimard',
  published: '20019',
  description: 'Un régal de drôlerie et de philosophie'
)

10.times do
  book = Book.new(
    title: Faker::Book.unique.title,
    author: Faker::Book.author,
    genre: Faker::Book.genre,
    editor: Faker::Book.publisher,
    published: Faker::Address.building_number,
    description: Faker::Quote.famous_last_words
  )
  book.save!
end

puts 'Finished !'
