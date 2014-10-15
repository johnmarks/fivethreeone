require 'test_helper'

class SetTemplatesControllerTest < ActionController::TestCase
  setup do
    @set_template = set_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:set_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create set_template" do
    assert_difference('SetTemplate.count') do
      post :create, set_template: { exercise_id: @set_template.exercise_id, reps: @set_template.reps, type: @set_template.type, weight: @set_template.weight }
    end

    assert_redirected_to basic_set_template_path(assigns(:set_template))
  end

  test "should show set_template" do
    get :show, id: @set_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @set_template
    assert_response :success
  end

  test "should update set_template" do
    patch :update, id: @set_template, set_template: { exercise_id: @set_template.exercise_id, reps: @set_template.reps, type: @set_template.type, weight: @set_template.weight }
    assert_redirected_to basic_set_template_path(assigns(:set_template))
  end

  test "should destroy set_template" do
    assert_difference('SetTemplate.count', -1) do
      delete :destroy, id: @set_template
    end

    assert_redirected_to set_templates_path
  end
end
