require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user1 = users(:albert)
    @user2 = users(:karina)
  end

  test 'get user friends' do
    user_friends = @user1.friends << @user2
    assert_not_empty user_friends, 'Friends is empty'
  end
end
