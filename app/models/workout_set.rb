class WorkoutSet < ActiveRecord::Base
  belongs_to :workout
  belongs_to :user

  def weight
    workout.weight_for(user)
  end

  def to_s
    "Exercise: #{workout.exercise}, Reps #{workout.reps}, Weight #{weight}"
  end
end
