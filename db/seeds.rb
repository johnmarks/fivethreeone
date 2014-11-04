program = Program.create! name: 'Five Three One', type: 'FiveThreeOneProgram'

exercises = ['Bench Press', 'Deadlift', 'Overhead Press', 'Squat'].inject([]) do |inj, e|
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


john = User.create email: 'john@bluefroggaming.com', password: 'mark1245', password_confirmation: 'mark1245'
john.setup = true
john.save!

bench = Exercise.find_by_name('Bench Press')
deadlift = Exercise.find_by_name('Deadlift')
press = Exercise.find_by_name('Overhead Press')
squat = Exercise.find_by_name('Squat')

john.update_working_one_rep_max(deadlift.id, 265)
john.update_increment_ammount(deadlift.id, 10)
john.update_working_one_rep_max(squat.id, 210)
john.update_increment_ammount(squat.id, 10)
john.update_working_one_rep_max(bench.id, 205)
john.update_working_one_rep_max(press.id, 125)

WorkoutManager.create_workout_sets(john, program)

cycle = john.current_cycle

cycle.each{|ws| ws.reps_completed = ws.reps}

cycle.select{|wo| wo.max_reps == true}.select{|wo| wo.exercise == 'Bench Press'}.select{|wo| wo.reps == 5}.first.reps_completed = 10
cycle.select{|wo| wo.max_reps == true}.select{|wo| wo.exercise == 'Deadlift'}.select{|wo| wo.reps == 5}.first.reps_completed = 12
cycle.select{|wo| wo.max_reps == true}.select{|wo| wo.exercise == 'Overhead Press'}.select{|wo| wo.reps == 5}.first.reps_completed = 10
cycle.select{|wo| wo.max_reps == true}.select{|wo| wo.exercise == 'Squat'}.select{|wo| wo.reps == 5}.first.reps_completed = 8
cycle.select{|wo| wo.max_reps == true}.select{|wo| wo.exercise == 'Bench Press'}.select{|wo| wo.reps == 3}.first.reps_completed = 7
cycle.select{|wo| wo.max_reps == true}.select{|wo| wo.exercise == 'Deadlift'}.select{|wo| wo.reps == 3}.first.reps_completed = 7
cycle.select{|wo| wo.max_reps == true}.select{|wo| wo.exercise == 'Overhead Press'}.select{|wo| wo.reps == 3}.first.reps_completed = 10
cycle.select{|wo| wo.max_reps == true}.select{|wo| wo.exercise == 'Squat'}.select{|wo| wo.reps == 3}.first.reps_completed = 7
cycle.select{|wo| wo.max_reps == true}.select{|wo| wo.exercise == 'Bench Press'}.select{|wo| wo.reps == 1}.first.reps_completed = 6
cycle.select{|wo| wo.max_reps == true}.select{|wo| wo.exercise == 'Deadlift'}.select{|wo| wo.reps == 1}.first.reps_completed = 9
cycle.select{|wo| wo.max_reps == true}.select{|wo| wo.exercise == 'Overhead Press'}.select{|wo| wo.reps == 1}.first.reps_completed = 6
cycle.select{|wo| wo.max_reps == true}.select{|wo| wo.exercise == 'Squat'}.select{|wo| wo.reps == 1}.first.reps_completed = 5

cycle.each{|ws| ws.finished = true; ws.save!}

program.progress(john.exercise_datas)

WorkoutManager.create_workout_sets(john, program)

cycle = john.current_cycle
cycle.each{|ws| ws.reps_completed = ws.reps}

cycle.select{|wo| wo.max_reps == true}.select{|wo| wo.exercise == 'Bench Press'}.select{|wo| wo.reps == 5}.first.reps_completed = 6
cycle.select{|wo| wo.max_reps == true}.select{|wo| wo.exercise == 'Deadlift'}.select{|wo| wo.reps == 5}.first.reps_completed = 10
cycle.select{|wo| wo.max_reps == true}.select{|wo| wo.exercise == 'Overhead Press'}.select{|wo| wo.reps == 5}.first.reps_completed = 10
cycle.select{|wo| wo.max_reps == true}.select{|wo| wo.exercise == 'Squat'}.select{|wo| wo.reps == 5}.first.reps_completed = 7
cycle.select{|wo| wo.max_reps == true}.select{|wo| wo.exercise == 'Bench Press'}.select{|wo| wo.reps == 3}.first.reps_completed = 5
cycle.select{|wo| wo.max_reps == true}.select{|wo| wo.exercise == 'Deadlift'}.select{|wo| wo.reps == 3}.first.reps_completed = 8
cycle.select{|wo| wo.max_reps == true}.select{|wo| wo.exercise == 'Overhead Press'}.select{|wo| wo.reps == 3}.first.reps_completed = 8
cycle.select{|wo| wo.max_reps == true}.select{|wo| wo.exercise == 'Squat'}.select{|wo| wo.reps == 3}.first.reps_completed = 4
cycle.select{|wo| wo.max_reps == true}.select{|wo| wo.exercise == 'Bench Press'}.select{|wo| wo.reps == 1}.first.reps_completed = 4
cycle.select{|wo| wo.max_reps == true}.select{|wo| wo.exercise == 'Deadlift'}.select{|wo| wo.reps == 1}.first.reps_completed = 6
cycle.select{|wo| wo.max_reps == true}.select{|wo| wo.exercise == 'Overhead Press'}.select{|wo| wo.reps == 1}.first.reps_completed = 4
cycle.select{|wo| wo.max_reps == true}.select{|wo| wo.exercise == 'Squat'}.select{|wo| wo.reps == 1}.first.reps_completed = 3

cycle.each{|ws| 
  ws.finished = true unless [13,14,15,16].include?(ws.day)  
  ws.save!
}


