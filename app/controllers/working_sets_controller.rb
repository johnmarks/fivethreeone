class WorkingSetsController < ApplicationController
  before_action :authenticate_user!
  def index
    @workout_sets = WorkoutManager.create_workout_sets(current_user, Program.first)
  end
end
