class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :exercise_datas
  has_many :workout_sets

  def current_workout
    new_sets = workout_sets.where(:finished => false).select{|wo| wo.day == next_workout_day }

    finished_today = workout_sets.where(:date => Date.today, :finished => true )

    (finished_today + new_sets).sort_by(&:created_at)
  end

  def last_workout_day
    last_set = workout_sets.where(:finished => true).last

    last_set.nil? ? 0 : last_set.day
  end

  def next_workout_day
    last_workout_day + 1
  end

  def has_workouts(program)
    ids = program.workouts.map(&:id)
    workout_sets.where(workout_id: ids).count > 0
  end

  def one_rep_max_for(exercise_id)
    exercise_datas.find(exercise_id).working_one_rep_max
  end

  def update_working_one_rep_max(exercise_id, new_max)
    e = exercise_datas.find(exercise_id)
    e.working_one_rep_max = new_max
    e.save!
  end

end
