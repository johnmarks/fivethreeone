class WorkoutSetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @workout_sets = WorkoutManager.create_workout_sets(current_user, Program.first)
  end

  def update
    @workout_set = WorkoutSet.find(params[:id])
  end

end
