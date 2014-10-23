class SetTemplate < ActiveRecord::Base
	belongs_to :exercise

  def weight_for(user)
    weight
  end
end
