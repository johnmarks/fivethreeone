Program.create! :name => 'Five Three One'

exercises = ['Deadlift', 'Overhead Press', 'Squat', 'Bench Press']
exercises = exercises.inject([]) do |inj, e|
	inj << Exercise.create!(:name => e)
end

exercises.each do |e|
  [5, 3, 1, -1].each do |i|
    SetTemplate.create! :type => 'FiveThreeOneSetTemplate', :reps => i, :exercise_id => e.id
  end
end