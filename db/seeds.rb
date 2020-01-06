Book.destroy_all

1000.times do |i|
  book = Book.new
  book.title = "Book" + i.to_s
  book.description = "Des" + i.to_s
  book.category = "Fiction"
  section1 = book.sections.build(name: "Chapter1")
  section2 = book.sections.build(name: "Chapter2")
  book.save
end


