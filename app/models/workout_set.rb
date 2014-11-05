class WorkoutSet < ActiveRecord::Base
  belongs_to :workout
  belongs_to :user
  
  delegate :day, :to => 'workout'
  delegate :exercise, :to => 'workout'
  delegate :max_reps, :to => 'workout'

  def estimated_one_rep_max
    w = weight
    (w * reps_completed * 0.0333 + w).round
  end

  def button_class
    finished ? 'btn-success' : 'btn-primary'
  end
end
