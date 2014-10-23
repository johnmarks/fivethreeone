class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :exercise_datas
  has_many :workout_sets

  def current_workout
    unfinished = workout_sets.where(:finished => false)

    return unfinished if unfinished.empty?

    one = unfinished.first
    partials = workout_sets.where(:date => one.date, :finished => true )

    (partials + unfinished).sort_by(&:created_at)
  end

  def last_workout_day
    last_set = workout_sets.where(:finished => true).last

    last_set.nil? ? 0 : last_set.day
  end

end
