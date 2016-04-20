require 'test_helper'

class PaymentTypeTest < ActiveSupport::TestCase

  fixtures :payment_types

  test 'payment type must match an enumerated type stored in the database' do
      payment_type = payment_types(:check)
      valid_types = PaymentType.pluck(:name)

      valid_types.each do |type|
        payment_type.name = type
        assert payment_type.valid?
      end
  end

  test 'payment type must not be a value other than the enumerated types stored in the database' do
    payment_type = payment_types(:check)
    invalid_types = %w{ 123 'cHeCk' 'horse' true false nil ''}

    invalid_types.each do |type|
      payment_type.name = type
      assert payment_type.invalid?
    end

    #assert payment_type.errors[:name].any?
  end
end
