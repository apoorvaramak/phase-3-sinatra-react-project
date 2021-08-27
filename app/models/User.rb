class User < ActiveRecord::Base
    has_many :reviews
    has_many :books, through: :reviews

    def reCalculateXP
        self.update(xp: self.books.distinct.sum(:page_count))
    end

    def self.allReCalculateXP
        User.all.each do |user|
            user.reCalculateXP
        end
    end
end