require 'test_helper'

class StoreControllerTest < ActionController::TestCase

  setup do
    @product_count = Product.count
  end

  test 'should get index listing with navigation links and valid products' do
    get :index
    assert_response :success

    @nav_links = 4
    @price_format = /\$[,\d]+\.\d\d/

    assert_select '#columns #side a', minimum: @nav_links
    assert_select '#main .entry', @product_count
    assert_select 'h3', products(:gameOfThrones).title
    assert_select '.price', @price_format
  end

  test 'markup needed for store.js.coffee is in place' do
    get :index
    assert_select '.store .entry > img', @product_count
    assert_select '.store .entry input[type=submit]', @product_count
  end
end
