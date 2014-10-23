class WorkoutSet < ActiveRecord::Base
  belongs_to :workout
  belongs_to :user
  delegate :day, :to => 'workout'
  delegate :exercise, :to => 'workout'
  attr_accessor :reps_completed

  def weight
    workout.weight_for(user)
  end

  def button_class
    self.finished? ? 'btn-success' : 'btn-primary'
  end

end
