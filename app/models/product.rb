class Product < ApplicationRecord

  validates :title, presence: true, uniqueness: {message: 'must be unique.'}
  validates :description, presence: true, length: {minimum: 10}
  validates :price, numericality: {greater_than: 0}
  scope :search, lambda {|keyword| where("title ILIKE ?", "%#{keyword}%") | where("description ILIKE ?", "%#{keyword}%")}

  after_initialize :set_price_default_to_1
  before_validation :capitalize_title


  private

  def set_price_default_to_1
    self.price ||= 1
  end

  def capitalize_title
    self.title = title.titleize
  end

end
