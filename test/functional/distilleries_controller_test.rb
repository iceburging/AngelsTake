require 'test_helper'

class DistilleriesControllerTest < ActionController::TestCase
  context "on GET to :index" do
    setup {get :index}
    should_assign_to :distilleries
    should_respond_with :success
    should_render_template :index
    should_not_set_the_flash
  end

  context "on GET to :show" do
    setup {get :show, :id => Factory.create(:distillery)}
    should_assign_to :distillery
    should_respond_with :success
    should_render_template :show
    should_not_set_the_flash
  end

  context "on GET to :new" do
    setup {get :new}
    should_assign_to :distillery
    should_respond_with :success
    should_render_template :new
    should_not_set_the_flash
  end

  context "on POST to :create" do
    context "with vaild attributes" do
      setup do
        post :create, Factory.attributes_for(:distillery)
      end
      should_assign_to :distillery
      should_redirect_to("the distillery details page") {distillery_path(assigns(:distillery))}
      should_set_the_flash_to "Successfully created distillery."
    end

    context "with invaild attributes" do
      setup do
        Distillery.any_instance.stubs(:save).returns(false)
        post :create, Factory.attributes_for(:distillery)
      end
      should_assign_to :distillery
      should_respond_with :success
      should_render_template :new
      should_not_set_the_flash
    end
  end

  context "on GET to :edit" do
    setup {get :edit, :id => Factory.create(:distillery)}
    should_assign_to :distillery
    should_respond_with :success
    should_render_template :edit
    should_not_set_the_flash
  end

  context "on PUT to :update" do
    context "with vaild attributes" do
      setup do
        put :update, Factory.create(:distillery).attributes
      end
      should_assign_to :distillery
      should_redirect_to("the distillery details page") {distillery_path(assigns(:distillery))}
      should_set_the_flash_to "Successfully updated distillery."
    end

    context "with invaild attributes" do
      setup do
        Distillery.any_instance.stubs(:update_attributes).returns(false)
        put :update, Factory.create(:distillery).attributes
      end
      should_assign_to :distillery
      should_respond_with :success
      should_render_template :edit
      should_not_set_the_flash
    end
  end

  context "on DELETE to :destroy" do
    should "destroy model and redirect to index action" do
      distillery = Distillery.first
      delete :destroy, :id => distillery
      assert_redirected_to distilleries_url
      assert !Distillery.exists?(distillery.id)
    end
  end
end

