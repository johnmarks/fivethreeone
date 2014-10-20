class SetTemplate < ActiveRecord::Base
	belongs_to :exercise

  def weight_for(user)
    weight
  end

  def to_s
    "#{exercise.name}: reps #{reps} weight #{weight}"
  end
end
