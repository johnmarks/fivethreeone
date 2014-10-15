require 'test_helper'

class SetTemplateBasesControllerTest < ActionController::TestCase
  setup do
    @set_template_basis = set_template_bases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:set_template_bases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create set_template_basis" do
    assert_difference('SetTemplateBase.count') do
      post :create, set_template_basis: { exercise_id: @set_template_basis.exercise_id, reps: @set_template_basis.reps, type: @set_template_basis.type, weight: @set_template_basis.weight }
    end

    assert_redirected_to set_template_basis_path(assigns(:set_template_basis))
  end

  test "should show set_template_basis" do
    get :show, id: @set_template_basis
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @set_template_basis
    assert_response :success
  end

  test "should update set_template_basis" do
    patch :update, id: @set_template_basis, set_template_basis: { exercise_id: @set_template_basis.exercise_id, reps: @set_template_basis.reps, type: @set_template_basis.type, weight: @set_template_basis.weight }
    assert_redirected_to set_template_basis_path(assigns(:set_template_basis))
  end

  test "should destroy set_template_basis" do
    assert_difference('SetTemplateBase.count', -1) do
      delete :destroy, id: @set_template_basis
    end

    assert_redirected_to set_template_bases_path
  end
end
