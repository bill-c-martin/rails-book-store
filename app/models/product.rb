class Product < ActiveRecord::Base
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  attr_accessible :description, :image_url, :price, :title

  validates :title, :description, :image_url, presence: true
  validates :title, length: {minimum: 3, maximum: 60}
  validates :price, numericality: {greater_than_or_equal_to: 0.01, less_than: 100}
  validates :title, uniqueness: true
  validates :image_url, uniqueness: true, allow_blank: true, format: {
    with:   %r{\.(gif|jpg|png)\Z}i,
    message: 'image must be gif, png, or jpg'
  }

  private
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items Present')
        return false
      end
    end
end
