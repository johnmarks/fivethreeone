class ChartsController < ApplicationController
  
  def index
    @bench_data = WorkoutManager.get_chart_data(current_user, 'Bench Press')
    @deadlift_data = WorkoutManager.get_chart_data(current_user, 'Deadlift')
    @press_data = WorkoutManager.get_chart_data(current_user, 'Overhead Press')
    @squat_data = WorkoutManager.get_chart_data(current_user, 'Squat')

    # @data = 
    # [
    #   {name: 'Bench Press', data: @bench_data},
    #   {name: 'Deadlift', data: @deadlift_data},
    #   {name: 'Overhead Press', data: @press_data},
    #   {name: 'Squats', data: @squat_data}
    # ]
  end
end
