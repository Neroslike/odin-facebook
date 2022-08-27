require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:albert)
    @post = posts(:first)
  end

  test 'should create post and redirect to post_path' do
    assert_difference('Post.count') do
      post posts_url, params: { post: { body: 'This is my first post, beware!', title: 'My first post' } }
    end

    assert_redirected_to post_path(Post.last)
  end

  test 'should create post without unpermitted parameters and redirect to post path' do
    assert_difference('Post.count') do
      post posts_url, params: { post: { body: 'This is another post', title: 'Beware of the params', dangerous: 'What is this?' } }
    end

    assert_not_includes Post.last.attributes, :dangerous
    assert_redirected_to post_path(Post.last)
  end

  test 'should update post with new parameters and redirect to post path' do
    patch post_url(@post), params: { post: { body: 'New body' } }
    assert_redirected_to post_path(@post)

    @post.reload
    assert_equal 'New body', @post.body
  end

  test 'should destroy post and redirect to index' do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_path
  end

  test 'should render index view' do
    get posts_path

    assert_response :success
  end

  test 'should render show view' do
    get post_url(@post)

    assert_response :success
  end

  test 'should render new view' do
    get new_post_url

    assert_response :success
  end

  test 'should render edit view' do
    get edit_post_url(@post)

    assert_response :success
  end
end
