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

user = User.create! :email => 'john@bluefroggaming.com', :password => 'mark1245', :password_confirmation => 'mark1245'


ExerciseData.create! :user_id => user.id, :exercise_id => Exercise.find_by_name('Deadlift').id, :one_rep_max => 300
ExerciseData.create! :user_id => user.id, :exercise_id => Exercise.find_by_name('Overhead Press').id, :one_rep_max => 140
ExerciseData.create! :user_id => user.id, :exercise_id => Exercise.find_by_name('Squat').id, :one_rep_max => 225
ExerciseData.create! :user_id => user.id, :exercise_id => Exercise.find_by_name('Bench Press').id, :one_rep_max => 225
  
