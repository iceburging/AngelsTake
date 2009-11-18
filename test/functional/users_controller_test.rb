require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  context "on GET to :index" do
    setup {get :index}
    should_assign_to :users
    should_respond_with :success
    should_render_template :index
    should_not_set_the_flash
  end

  context "on GET to :show" do
    setup {get :show, :id => Factory.create(:user)}
    should_assign_to :user
    should_respond_with :success
    should_render_template :show
    should_not_set_the_flash
  end

  context "on GET to :new" do
    setup {get :new}
    should_assign_to :user
    should_respond_with :success
    should_render_template :new
    should_not_set_the_flash
  end

  context "on POST to :create" do
    context "with vaild attributes" do
      setup do
        post :create, :user => Factory.attributes_for(:user)
      end
      should_assign_to :user
      should_redirect_to("the user details page") {user_path(assigns(:user))}
      should_set_the_flash_to "Successfully created user."
    end

    context "with invaild attributes" do
      setup do
        User.any_instance.stubs(:save).returns(false)
        post :create, :user => Factory.attributes_for(:user)
      end
      should_assign_to :user
      should_respond_with :success
      should_render_template :new
      should_not_set_the_flash
    end
  end

  context "on GET to :edit" do
    setup {get :edit, :id => Factory.create(:user)}
    should_assign_to :user
    should_respond_with :success
    should_render_template :edit
    should_not_set_the_flash
  end

  context "on PUT to :update" do
    context "with vaild attributes" do
      setup do
        put :update, Factory.create(:user).attributes
      end
      should_assign_to :user
      should_redirect_to("the user details page") {user_path(assigns(:user))}
      should_set_the_flash_to "Successfully updated user."
    end

    context "with invaild attributes" do
      setup do
        User.any_instance.stubs(:update_attributes).returns(false)
        put :update, Factory.create(:user).attributes
      end
      should_assign_to :user
      should_respond_with :success
      should_render_template :edit
      should_not_set_the_flash
    end
  end

  context "on DELETE to :destroy" do
    should "destroy model and redirect to index action" do
      user = User.first
      delete :destroy, :id => user
      assert_redirected_to users_url
      assert !User.exists?(user.id)
    end
  end
end

