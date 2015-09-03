require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  fixtures :products

  test 'product attributes must not be empty' do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test 'product title must be at least 3 characters in length' do
    product = products(:gameOfThrones)
    product.title = 'a'
    assert product.invalid?
    product.title = 'ab'
    assert product.invalid?
    product.title = 'abc'
    assert product.valid?
  end

  test 'product title must be no more than 60 characters in length' do
    product = products(:gameOfThrones)
    product.title = 60.times.map{[*'a'..'z'].sample}.join
    assert product.valid?
    product.title = 61.times.map{[*'a'..'z'].sample}.join
    assert product.invalid?
  end

  test 'product price must not be negative' do
    product       = products(:gameOfThrones)
    product.price = -1
    assert product.invalid?
    assert_equal ['must be greater than or equal to 0.01'], product.errors[:price]
  end

  test 'product price must not be zero' do
    product       = products(:gameOfThrones)
    product.price = 0
    assert product.invalid?
    assert_equal ['must be greater than or equal to 0.01'], product.errors[:price]
  end

  test 'product price must be positive' do
    product       = products(:gameOfThrones)
    product.price = 1
    assert product.valid?
  end

  test 'product price must not be $100 or more' do
    product       = products(:gameOfThrones)
    product.price = 99;
    assert product.valid?
    product.price = 100;
    assert product.invalid?
  end

  test 'image url must be unique' do
    product = Product.new(
      title: "Some valid title",
      description: "Some valid description",
      price: 1,
      image_url: products(:gameOfThrones).image_url
    )

    assert product.invalid?
  end

  test 'image url must be a valid gif, jpg, or png' do

    product = products(:gameOfThrones)
    ok      = %w{ test.gif test.jpg test.png TEST.JPG TEST.Jpg http://a.b.c/x/y/z/test.gif }
    bad     = %w{ test.doc test.gif/more test.gif.more }

    ok.each do |name|
      product.image_url = name
      assert product.valid?, '#{name} should not be invalid'
    end

    bad.each do |name|
      product.image_url = name
      assert product.invalid?, '#{name} should not be valid'
    end
  end

  test 'product is not valid without a unique title' do
    product = Product.new(
      title:       products(:gameOfThrones).title,
      description: 'yyy',
      price:       1,
      image_url:   'fred.gif'
    )

    assert product.invalid?
    assert_equal [I18n.translate('activerecord.errors.messages.taken')], product.errors[:title]
  end
end
