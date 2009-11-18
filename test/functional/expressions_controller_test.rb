require 'test_helper'

class ExpressionsControllerTest < ActionController::TestCase
  context "on GET to :index" do
    setup {get :index}
    should_assign_to :expressions
    should_respond_with :success
    should_render_template :index
    should_not_set_the_flash
  end

  context "on GET to :show" do
    setup {get :show, :id => Factory.create(:expression)}
    should_assign_to :expression
    should_respond_with :success
    should_render_template :show
    should_not_set_the_flash
  end

  context "on GET to :new" do
    setup {get :new}
    should_assign_to :expression
    should_respond_with :success
    should_render_template :new
    should_not_set_the_flash
  end

  context "on POST to :create" do
    context "with vaild attributes" do
      setup do
        post :create, :expression => Factory.attributes_for(:expression)
      end
      should_assign_to :expression
      should_redirect_to("the expression details page") {expression_path(assigns(:expression))}
      should_set_the_flash_to "Successfully created expression."
    end

    context "with invaild attributes" do
      setup do
        Expression.any_instance.stubs(:save).returns(false)
        post :create, :expression => Factory.attributes_for(:expression)
      end
      should_assign_to :expression
      should_respond_with :success
      should_render_template :new
      should_not_set_the_flash
    end
  end

  context "on GET to :edit" do
    setup {get :edit, :id => Factory.create(:expression)}
    should_assign_to :expression
    should_respond_with :success
    should_render_template :edit
    should_not_set_the_flash
  end

  context "on PUT to :update" do
    context "with vaild attributes" do
      setup do
        put :update, Factory.create(:expression).attributes
      end
      should_assign_to :expression
      should_redirect_to("the expression details page") {expression_path(assigns(:expression))}
      should_set_the_flash_to "Successfully updated expression."
    end

    context "with invaild attributes" do
      setup do
        Expression.any_instance.stubs(:update_attributes).returns(false)
        put :update, Factory.create(:expression).attributes
      end
      should_assign_to :expression
      should_respond_with :success
      should_render_template :edit
      should_not_set_the_flash
    end
  end

  context "on DELETE to :destroy" do
    should "destroy model and redirect to index action" do
      expression = Expression.first
      delete :destroy, :id => expression
      assert_redirected_to expressions_url
      assert !Expression.exists?(expression.id)
    end
  end
end

