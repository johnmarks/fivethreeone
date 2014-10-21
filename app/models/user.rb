class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :exercise_datas
  has_many :workout_sets

  def current_workout
    workout_sets.where(:finished => false)
  end

  def last_workout_day
    last_set = workout_sets.where(:finished => true).last

    last_set.nil? ? 0 : last_set.day
  end

end
