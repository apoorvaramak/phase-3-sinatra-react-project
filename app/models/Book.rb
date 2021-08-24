class Book < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews

    def self.book_with_reviews
        Book.all.map{|one_book| one_book.reviews
        }
    end
    
end