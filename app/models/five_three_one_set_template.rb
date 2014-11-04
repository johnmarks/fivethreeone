class FiveThreeOneSetTemplate < SetTemplate
  def weight_for(user)
    orm = user.exercise_datas.select{|d| d.exercise_id == exercise.id}.first.working_one_rep_max
   
    w = (orm * weight / 100.0).round * 2
    w = w.round(-1)/2
  end
end