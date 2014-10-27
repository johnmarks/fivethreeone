class FiveThreeOneProgram < Program

  def progress(exercise_datas)
    exercise_datas.each do |data|
      data.working_one_rep_max += data.increment_ammount
      data.save!
    end
  end

end