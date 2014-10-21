class Program < ActiveRecord::Base
	has_many :workouts

  def days_in_workout
    workouts.empty? ? 0 : workouts.last.day
  end
end
