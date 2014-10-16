program = Program.create! :name => 'Five Three One'

exercises = ['Deadlift', 'Overhead Press', 'Squat', 'Bench Press'].inject([]) do |inj, e|
	inj << Exercise.create!(:name => e)
end

# Create the 16 days in 5/3/1
exercises.each_with_index do |e, i|
  data = [
    {:reps => 5, :weight => 65}, {:reps => 5, :weight => 75}, {:reps => -1, :weight => 85},
    {:reps => 3, :weight => 70}, {:reps => 3, :weight => 80}, {:reps => -1, :weight => 90},
    {:reps => 5, :weight => 75}, {:reps => 3, :weight => 85}, {:reps => -1, :weight => 95},
    {:reps => 5, :weight => 40}, {:reps => 5, :weight => 50}, {:reps => 5, :weight => 60},
  ]
  
  data.each_with_index do |d, j|
    st = FiveThreeOneSetTemplate.create! :exercise_id => e.id, :reps => d[:reps], :weight => d[:weight]
    day = (i+1)+((j/3)*4)
    program.workouts.create! :day => day, :set_template_id => st.id
  end
end


user = User.create! :email => 'john@bluefroggaming.com', :password => 'mark1245', :password_confirmation => 'mark1245'

ExerciseData.create! :user_id => user.id, :exercise_id => Exercise.find_by_name('Deadlift').id, :one_rep_max => 300
ExerciseData.create! :user_id => user.id, :exercise_id => Exercise.find_by_name('Overhead Press').id, :one_rep_max => 140
ExerciseData.create! :user_id => user.id, :exercise_id => Exercise.find_by_name('Squat').id, :one_rep_max => 225
ExerciseData.create! :user_id => user.id, :exercise_id => Exercise.find_by_name('Bench Press').id, :one_rep_max => 225
  
