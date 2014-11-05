class WorkoutManager
  def self.get_current_cycle(user, program)
    current_cycle = user.current_cycle
    return current_cycle unless current_cycle.empty?

    if user.has_workouts(program)
      program.progress(user.exercise_datas)
    end

    self.create_workout_sets(user, program)
  end

  def self.create_workout_sets(user, program)
    cycle = user.next_cycle(program)
    program.workouts.map do |w|
      WorkoutSet.create! user_id: user.id, finished: false, reps: w.reps, 
                         weight: w.weight_for(user), workout_id: w.id, cycle: cycle
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