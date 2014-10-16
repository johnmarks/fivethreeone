program = Program.create! :name => 'Five Three One'
day = 1

exercises = ['Deadlift', 'Overhead Press', 'Squat', 'Bench Press']
exercises = exercises.inject([]) do |inj, e|
	inj << Exercise.create!(:name => e)
end

exercises.each do |e|
  [5, 3, 1, -1].each do |i|
    FiveThreeOneSetTemplate.create!  :reps => i, :exercise_id => e.id
  end
end

# Create the 5 days in 5/3/1
exercises.each do |e|
  set_template = SetTemplate.where(:exercise_id => e.id, :reps => 5).first
  program.workouts.create! :day => day, :set_template_id => set_template.id
  program.workouts.create! :day => day, :set_template_id => set_template.id
  set_template = SetTemplate.where(:exercise_id => e.id, :reps => -1).first
  program.workouts.create! :day => day, :set_template_id => set_template.id
  day += 1
end

# Create the 3 days in 5/3/1
exercises.each do |e|
  set_template = SetTemplate.where(:exercise_id => e.id, :reps => 3).first
  program.workouts.create! :day => day, :set_template_id => set_template.id
  program.workouts.create! :day => day, :set_template_id => set_template.id
  set_template = SetTemplate.where(:exercise_id => e.id, :reps => -1).first
  program.workouts.create! :day => day, :set_template_id => set_template.id
  day += 1
end

# create the 5/3/1 days in 5/3/1
exercises.each do |e|
  set_template = SetTemplate.where(:exercise_id => e.id, :reps => 5).first
  program.workouts.create! :day => day, :set_template_id => set_template.id
  set_template = SetTemplate.where(:exercise_id => e.id, :reps => 3).first
  program.workouts.create! :day => day, :set_template_id => set_template.id
  set_template = SetTemplate.where(:exercise_id => e.id, :reps => -1).first
  program.workouts.create! :day => day, :set_template_id => set_template.id
  day += 1
end

# create the deload days in 5/3/1
exercises.each do |e|
  set_template = SetTemplate.where(:exercise_id => e.id, :reps => 5).first
  program.workouts.create! :day => day, :set_template_id => set_template.id
  program.workouts.create! :day => day, :set_template_id => set_template.id
  program.workouts.create! :day => day, :set_template_id => set_template.id
  day += 1
end


  
