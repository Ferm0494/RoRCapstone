require 'test_helper'

class FrameworksControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get frameworks_new_url
    assert_response :success
  end

  test 'should get edit' do
    get frameworks_edit_url
    assert_response :success
  end

  test 'should get create' do
    get frameworks_create_url
    assert_response :success
  end

  test 'should get update' do
    get frameworks_update_url
    assert_response :success
  end

  test 'should get index' do
    get frameworks_index_url
    assert_response :success
  end
end
