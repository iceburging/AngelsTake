require 'test_helper'

class ScoresControllerTest < ActionController::TestCase
  context "on GET to :index" do
    setup {get :index}
    should_assign_to :scores
    should_respond_with :success
    should_render_template :index
    should_not_set_the_flash
  end

  context "on GET to :show" do
    setup {get :show, :id => Factory.create(:score)}
    should_assign_to :score
    should_respond_with :success
    should_render_template :show
    should_not_set_the_flash
  end

  context "on GET to :new" do
    setup {get :new}
    should_assign_to :score
    should_respond_with :success
    should_render_template :new
    should_not_set_the_flash
  end

  context "on POST to :create" do
    context "with vaild attributes" do
      setup do
        post :create, :score => Factory.attributes_for(:score)
      end
      should_assign_to :score
      should_redirect_to("the score details page") {score_path(assigns(:score))}
      should_set_the_flash_to "Successfully created score."
    end

    context "with invaild attributes" do
      setup do
        Score.any_instance.stubs(:save).returns(false)
        post :create, :score => Factory.attributes_for(:score)
      end
      should_assign_to :score
      should_respond_with :success
      should_render_template :new
      should_not_set_the_flash
    end
  end

  context "on GET to :edit" do
    setup {get :edit, :id => Factory.create(:score)}
    should_assign_to :score
    should_respond_with :success
    should_render_template :edit
    should_not_set_the_flash
  end

  context "on PUT to :update" do
    context "with vaild attributes" do
      setup do
        put :update, Factory.create(:score).attributes
      end
      should_assign_to :score
      should_redirect_to("the score details page") {score_path(assigns(:score))}
      should_set_the_flash_to "Successfully updated score."
    end

    context "with invaild attributes" do
      setup do
        Score.any_instance.stubs(:update_attributes).returns(false)
        put :update, Factory.create(:score).attributes
      end
      should_assign_to :score
      should_respond_with :success
      should_render_template :edit
      should_not_set_the_flash
    end
  end

  context "on DELETE to :destroy" do
    should "destroy model and redirect to index action" do
      score = Score.first
      delete :destroy, :id => score
      assert_redirected_to scores_url
      assert !Score.exists?(score.id)
    end
  end
end

