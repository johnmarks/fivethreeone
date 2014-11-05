class Workout < ActiveRecord::Base
	belongs_to :program
	belongs_to :set_template
  delegate :reps, :to => 'set_template'
  delegate :max_reps, :to => 'set_template'

  def weight_for(user)
    set_template.weight_for(user)
  end

  def exercise
    set_template.exercise.name
  end
end
