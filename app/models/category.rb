class Category < ApplicationRecord
    has_many :onomatopoeium
    has_one_attached :image
end
