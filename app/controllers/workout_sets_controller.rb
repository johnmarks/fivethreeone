class WorkoutSetsController < ApplicationController
  before_filter :check_for_setup

  def index
    @workout_sets = WorkoutManager.get_current_workout(current_user, Program.first)
  end

  def update
    @workout_set = WorkoutSet.find(params[:id])
    @workout_set.date = Date.today
    @workout_set.update(workout_set_params)
  end

  private

  def workout_set_params
      params.require(:workout_set).permit(:finished, :reps, :reps_completed, :set_finished)
  end
  
  def check_for_setup
    redirect_to exercise_datas_url unless current_user.setup
  end

end
