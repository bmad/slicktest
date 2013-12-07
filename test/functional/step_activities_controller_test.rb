require 'test_helper'

class StepActivitiesControllerTest < ActionController::TestCase
  setup do
    @step_activity = step_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:step_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create step_activity" do
    assert_difference('StepActivity.count') do
      post :create, step_activity: { : @step_activity., description: @step_activity.description }
    end

    assert_redirected_to step_activity_path(assigns(:step_activity))
  end

  test "should show step_activity" do
    get :show, id: @step_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @step_activity
    assert_response :success
  end

  test "should update step_activity" do
    put :update, id: @step_activity, step_activity: { : @step_activity., description: @step_activity.description }
    assert_redirected_to step_activity_path(assigns(:step_activity))
  end

  test "should destroy step_activity" do
    assert_difference('StepActivity.count', -1) do
      delete :destroy, id: @step_activity
    end

    assert_redirected_to step_activities_path
  end
end
