class WorkoutManager
  def self.get_current_workout(user, program)
    current_day = self.next_workout_day(user, program)

    if current_day > 1
      return user.current_workout
    else
      sets = self.create_workout_sets(user, program)
    end

    sets.select{|s| s.day == 1}
  end

  def self.create_workout_sets(user, program)
    program.workouts.inject([]) do |inj, t|
      ws = WorkoutSet.create! user_id: user.id, finished: false, reps: t.reps, weight: t.weight, workout_id: t.id
      inj << ws
    end
  end

  def self.get_templates_for(program, day=1)
    program.workouts.where(:day => day)
  end

  def self.next_workout_day(user, program)
    users_last = user.last_workout_day
    days_in_program = program.days_in_workout

    users_last >= days_in_program ? 1 : users_last + 1
  end
end