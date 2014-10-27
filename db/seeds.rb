program = Program.create! name: 'Five Three One', type: 'FiveThreeOneProgram'

exercises = ['Deadlift', 'Overhead Press', 'Squat', 'Bench Press'].inject([]) do |inj, e|
	inj << Exercise.create!(name: e)
end

# Create the 16 days in 5/3/1
exercises.each_with_index do |e, i|
  data = [
    {reps:  5, weight:  40, max_reps: false}, {reps:  5, weight:  50, max_reps: false}, {reps:  3, weight:  60, max_reps: false}, 
    {reps:  5, weight:  65, max_reps: false}, {reps:  5, weight:  75, max_reps: false}, {reps:  5, weight:  85, max_reps: true}, 
    {reps:  5, weight:  40, max_reps: false}, {reps:  5, weight:  50, max_reps: false}, {reps:  3, weight:  60, max_reps: false}, 
    {reps:  3, weight:  70, max_reps: false}, {reps:  3, weight:  80, max_reps: false}, {reps:  3, weight:  90, max_reps: true},
    {reps:  5, weight:  40, max_reps: false}, {reps:  5, weight:  50, max_reps: false}, {reps:  3, weight:  60, max_reps: false}, 
    {reps:  5, weight:  75, max_reps: false}, {reps:  3, weight:  85, max_reps: false}, {reps:  1, weight:  95, max_reps: true},
    {reps:  5, weight:  40, max_reps: false}, {reps:  5, weight:  50, max_reps: false}, {reps:  5, weight:  60, max_reps: false}
  ]
  
  data.each_with_index do |d, j|
    params = { exercise_id: e.id, reps: d[:reps], weight: d[:weight], max_reps: d[:max_reps] }
    st = FiveThreeOneSetTemplate.create! params

    day = (i+1)+((j/6)*4)
    program.workouts.create! day: day, set_template_id: st.id
  end
end


user = User.create! email: 'john@bluefroggaming.com', password: 'mark1245', password_confirmation: 'mark1245'

ExerciseData.create! user_id: user.id, exercise_id: Exercise.find_by_name('Deadlift').id, working_one_rep_max: 300, increment_ammount: 10
ExerciseData.create! user_id: user.id, exercise_id: Exercise.find_by_name('Overhead Press').id, working_one_rep_max: 140, increment_ammount: 5
ExerciseData.create! user_id: user.id, exercise_id: Exercise.find_by_name('Squat').id, working_one_rep_max: 225, increment_ammount: 10
ExerciseData.create! user_id: user.id, exercise_id: Exercise.find_by_name('Bench Press').id, working_one_rep_max: 225, increment_ammount: 5
  
