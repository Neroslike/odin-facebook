require "application_system_test_case"
require "test_helper"

class UsersTest < ApplicationSystemTestCase
  setup do
    sign_in users(:albert)
    @post = posts(:first)
  end

  test 'post title should contain h3 tag' do
    visit post_url(@post)
    assert_selector 'h3', text: 'My first post'
    take_screenshot
  end

  test 'post body should contain p tag' do
    visit post_url(@post)
    assert_selector 'p', text: 'This is my first post, beware!'
    take_screenshot
  end

  test 'post id should match' do
    visit post_url(@post)
    assert_equal 1, @post.id, 'Wrong or missing id'
  end
end
