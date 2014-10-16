class Workout < ActiveRecord::Base
	belongs_to :program
	belongs_to :set_template
end
