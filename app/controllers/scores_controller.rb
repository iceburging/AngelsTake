class ScoresController < ApplicationController
  def index
    @scores = Score.all
  end
  
  def show
    @score = Score.find(params[:id])
  end
  
  def new
    @score = Score.new
  end
  
  def create
    @score = Score.new(params[:score])
    if @score.save
      flash[:notice] = "Successfully created score."
      redirect_to @score
    else
      render :action => 'new'
    end
  end
  
  def edit
    @score = Score.find(params[:id])
  end
  
  def update
    @score = Score.find(params[:id])
    if @score.update_attributes(params[:score])
      flash[:notice] = "Successfully updated score."
      redirect_to @score
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @score = Score.find(params[:id])
    @score.destroy
    flash[:notice] = "Successfully destroyed score."
    redirect_to scores_url
  end
end
