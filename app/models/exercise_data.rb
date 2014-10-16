class ExerciseData < ActiveRecord::Base
  belongs_to :user
  has_one :exercise
end
