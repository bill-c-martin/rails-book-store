class Order < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  belongs_to :payment_type

  attr_accessible :address, :email, :name, :payment_type_id

  validates :name, :address, :email, :presence => true
  validates :payment_type_id, :presence => true

  # validates :payment_type, :inclusion => PaymentType.types

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
