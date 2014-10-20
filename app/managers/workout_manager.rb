class WorkoutManager
  def self.create_workout_sets(user, program)
    return user.current_workout if !user.current_workout.empty?

    templates = self.get_templates_for(program)

    templates.inject([]) do |inj, t|
      ws = WorkoutSet.create! :user_id => user.id, :finished => false, 
                              :reps => t.reps, :weight => t.weight, :workout_id => t.id

      inj << ws
    end
  end

  def self.get_templates_for(program, day=1)
    program.workouts.where(:day => day)
  end
end