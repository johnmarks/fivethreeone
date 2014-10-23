class WorkoutSet < ActiveRecord::Base
  belongs_to :workout
  belongs_to :user
  
  delegate :day, :to => 'workout'
  delegate :exercise, :to => 'workout'
  delegate :max_reps, :to => 'workout'

  def weight
    workout.weight_for(user)
  end

  def button_class
    finished ? 'btn-success' : 'btn-primary'
  end
end
