class DistilleriesController < ApplicationController
  def index
    @distilleries = Distillery.all
  end

  def show
    @distillery = Distillery.find(params[:id])
  end

  def new
    @distillery = Distillery.new
  end

  def create
    @distillery = Distillery.new(params[:distillery])
    if @distillery.save
      flash[:notice] = "Successfully created distillery."
      redirect_to @distillery
    else
      render :action => 'new'
    end
  end

  def edit
    @distillery = Distillery.find(params[:id])
  end

  def update
    @distillery = Distillery.find(params[:id])
    if @distillery.update_attributes(params[:distillery])
      flash[:notice] = "Successfully updated distillery."
      redirect_to @distillery
    else
      render :action => 'edit'
    end
  end

  def destroy
    @distillery = Distillery.find(params[:id])
    @distillery.destroy
    flash[:notice] = "Successfully destroyed distillery."
    redirect_to distilleries_url
  end
end

