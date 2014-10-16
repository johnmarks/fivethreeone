class Workout < ActiveRecord::Base
	belongs_to :program
	has_one :set_template
end
