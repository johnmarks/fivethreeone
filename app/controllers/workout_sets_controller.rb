class WorkoutSetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @workout_sets = WorkoutManager.create_workout_sets(current_user, Program.first)
  end

  def update
    @workout_set = WorkoutSet.find(params[:id])
    @workout_set.update(workout_set_params)
  end

  private

  def workout_set_params
      params.require(:workout_set).permit(:finished, :reps, :reps_completed, :set_finished)
  end

end
