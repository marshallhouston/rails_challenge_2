require 'rails_helper'

describe "When a user visits a book show page" do
  scenario "I see the book title and reivews" do
    book = Book.create(title: "Book1")
    book.reviews.create(username: "grayton", body: "i really liked this book", rating: 4)
    visit book_path(book)

    expect(page).to have_content("Book1")

    within(".reviews") do
      expect(page).to have_content "username: grayton"
      expect(page).to have_content "review: i really liked this book"
      expect(page).to have_content "rating: 4"
    end
  end
end
