require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "get new user page" do
    get new_user_path
    assert_template :new
  end

  test "create user succeeded" do
    user_params = { 
      user: {
        email: "czinni853@gmail.com",
        first_name: "Viii",
        last_name: "Pie",
        address: "123 Main St"
      }
    }
  
    post users_path, params: user_params
  
    assert_redirected_to users_path
    assert_equal "Welcome to fandnext", flash[:success]
  end
  

  test "create user failed" do
    user_params = { 
      user: {
        email: "invalid-email",
        first_name: "Apple",
        last_name: "Pie",
        address: "123 Main St"
      }
    }
  
    post users_path, params: user_params
  
    assert_template :new
    assert_equal "Domain invalid", flash[:warning]
  end
end
