class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :cart

  attr_accessible :cart_id
  attr_accessor :item_price

  def total_price
    product.price * quantity
  end
end
