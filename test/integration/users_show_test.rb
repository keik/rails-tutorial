require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  def setup
    @activated_user   = users(:archer)
    @unactivated_user = users(:bob)
  end

  test 'do' do
    get user_path(@activated_user)
    assert_template 'users/show'

    get user_path(@unactivated_user)
    assert_redirected_to root_url
  end
end
