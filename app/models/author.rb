class Author < ApplicationRecord
    has_many :book_authors
    has_many :books, through: :book_authors

    
    validates :name, :birth_year, presence: true
    validates :birth_year, numericality: true
    validates :birth_year, inclusion: { in: 0..2019 }
    
    validates :name, uniqueness: true
end
