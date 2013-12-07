require 'test_helper'

class RunStepActivitiesControllerTest < ActionController::TestCase
  setup do
    @run_step_activity = run_step_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:run_step_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create run_step_activity" do
    assert_difference('RunStepActivity.count') do
      post :create, run_step_activity: { : @run_step_activity., new_state: @run_step_activity.new_state }
    end

    assert_redirected_to run_step_activity_path(assigns(:run_step_activity))
  end

  test "should show run_step_activity" do
    get :show, id: @run_step_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @run_step_activity
    assert_response :success
  end

  test "should update run_step_activity" do
    put :update, id: @run_step_activity, run_step_activity: { : @run_step_activity., new_state: @run_step_activity.new_state }
    assert_redirected_to run_step_activity_path(assigns(:run_step_activity))
  end

  test "should destroy run_step_activity" do
    assert_difference('RunStepActivity.count', -1) do
      delete :destroy, id: @run_step_activity
    end

    assert_redirected_to run_step_activities_path
  end
end
