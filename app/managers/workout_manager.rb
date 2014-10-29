class WorkoutManager
  def self.get_current_workout(user, program)
    current_workout = user.current_workout
    return current_workout unless current_workout.empty?
    
    if user.has_workouts(program)
      program.progress(user.exercise_datas)
    end
    
    sets = self.create_workout_sets(user, program)

    sets.select{|s| s.day == 1}
  end

  def self.create_workout_sets(user, program)
    program.workouts.map do |w|
      WorkoutSet.create! user_id: user.id, finished: false, reps: w.reps, weight: w.weight, workout_id: w.id
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