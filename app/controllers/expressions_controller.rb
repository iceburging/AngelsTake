class ExpressionsController < ApplicationController
  def index
    @expressions = Expression.all
  end
  
  def show
    @expression = Expression.find(params[:id])
  end
  
  def new
    @expression = Expression.new
  end
  
  def create
    @expression = Expression.new(params[:expression])
    if @expression.save
      flash[:notice] = "Successfully created expression."
      redirect_to @expression
    else
      render :action => 'new'
    end
  end
  
  def edit
    @expression = Expression.find(params[:id])
  end
  
  def update
    @expression = Expression.find(params[:id])
    if @expression.update_attributes(params[:expression])
      flash[:notice] = "Successfully updated expression."
      redirect_to @expression
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @expression = Expression.find(params[:id])
    @expression.destroy
    flash[:notice] = "Successfully destroyed expression."
    redirect_to expressions_url
  end
end
