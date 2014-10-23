class WorkoutManager
  def self.create_workout_sets(user, program)
    return user.current_workout if !user.current_workout.empty?

    day = self.next_workout_day(user, program)
    templates = self.get_templates_for(program, day)

    templates.inject([]) do |inj, t|
      ws = WorkoutSet.create! :user_id => user.id, :finished => false, 
                              :reps => t.reps, :weight => t.weight, :workout_id => t.id,
                              :date => Date.today

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