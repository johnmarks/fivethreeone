class FiveThreeOneSetTemplate < SetTemplate
  def weight_for(user)
    orm = ExerciseData.where(:user_id => user.id, :exercise_id => exercise.id).first.working_one_rep_max

    (orm * weight / 100.0).floor
  end
end