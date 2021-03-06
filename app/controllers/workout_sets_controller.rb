class WorkoutSetsController < ApplicationController
  before_filter :check_for_setup

  def index
    @program = Program.first # TODO: users should be able to pick theier program
    @workout_sets = WorkoutManager.get_current_cycle(current_user, @program)
    @current_day = WorkoutManager.next_workout_day(current_user, @program)
  end

  def update
    @workout_set = WorkoutSet.find(params[:id])
    @workout_set.date = Date.today unless @workout_set.date
    @workout_set.update(workout_set_params)
  end

  private

  def workout_set_params
      params.require(:workout_set).permit(:finished, :reps, :reps_completed, :set_finished)
  end
  
  def check_for_setup
    redirect_to settings_url unless current_user.setup
  end

end
