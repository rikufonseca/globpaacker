class StepsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :visit]

  def create
    @navigation = Navigation.find(params[:navigation_id])
    @place = Place.find(params[:place_id])
    @step = Step.new
    @step.navigation = @navigation
    @step.place = @place
    @step.visited = false
    if @step.save
      redirect_to navigation_path(@navigation)
      flash[:notice] = "Let's go!"
    else
      flash[:notice] = "Sorry, we can't bring you to that place"
    end
  end

  def visit
    @step = Step.find(params[:id])
    @step.visited = true
    @step.save
    redirect_to navigation_path(@step.navigation)
  end
end
