class WorkoutSet < ActiveRecord::Base
  belongs_to :workout
  belongs_to :user
end
