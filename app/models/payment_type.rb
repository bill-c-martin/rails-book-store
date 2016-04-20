class PaymentType < ActiveRecord::Base
  has_many :orders

  attr_accessible :name

  validates :name, :inclusion => { :in => proc { PaymentType.pluck(:name) } }
end
