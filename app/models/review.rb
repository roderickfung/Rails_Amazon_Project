class Review < ApplicationRecord
  belongs_to :product

  validates :star_count, presence: true, numericality:{greater_than:0, less_than:6}
  # validates_inclusion_of :star_count, in: 1..5
end
