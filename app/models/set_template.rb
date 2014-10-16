class SetTemplate < ActiveRecord::Base
	belongs_to :exercise

  def to_s
    "#{exercise.name}: reps #{reps} weight #{weight}"
  end
end
