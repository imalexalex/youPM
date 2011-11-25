require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should login" do
    bob = managers(:one)
    post :create, email: bob.email, password: 'secret'
    assert_redirected_to admin_url
    assert_equal bob.id, session[:manager_id]
  end

  test "should fail login" do
    bob = managers(:one)
    post :create, name: bob.email, password: 'wrong'
    assert_redirected_to login_url
  end
  
  test "should logout" do
    delete :destroy
    assert_redirected_to index
  end
end
