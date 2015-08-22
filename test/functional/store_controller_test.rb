require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test 'should get index' do
    get :index
    assert_response :success
    assert_select '#columns #side a', minimum: 4 # 4 links in left col
    assert_select '#main .entry', 3              # 3 products display
    assert_select 'h3', 'A Game of Thrones'      # Verify a title
    assert_select '.price', /\$[,\d]+\.\d\d/     # Verify a price exists with format 123,123.45
  end

end
