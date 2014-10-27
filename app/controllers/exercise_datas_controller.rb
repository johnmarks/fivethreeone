class ExerciseDatasController < ApplicationController
  def index
    # for now im just getting exercise data needed for 5/3/1 could add more later
    @exercise_datas = current_user.exercise_datas
  end

  def update
    @exercise_data = ExerciseData.find(params[:id])
    @exercise_data.update(exercise_data_params)
  end

  def exercise_data_params
    params.require(:exercise_data).permit(:working_one_rep_max, :increment_ammount)
  end
end
