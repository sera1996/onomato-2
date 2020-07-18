class Onomatopoeium < ApplicationRecord
    belongs_to :category
    has_one_attached :example
    has_many :samples
    accepts_nested_attributes_for :samples, allow_destroy: true, :reject_if => :all_blank
end
