require 'test_helper'

class MeishisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get meishis_index_url
    assert_response :success
  end

  test "should get show" do
    get meishis_show_url
    assert_response :success
  end

  test "should get new" do
    get meishis_new_url
    assert_response :success
  end

  test "should get edit" do
    get meishis_edit_url
    assert_response :success
  end

end
