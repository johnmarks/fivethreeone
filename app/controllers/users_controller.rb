class UsersController < ApplicationController
  def settings
    @exercise_datas = current_user.exercise_datas.preload('exercise')
  end

  def update_settings
    @exercise_datas = current_user.exercise_datas
    @exercise_datas.each do |d|
      d.working_one_rep_max = params[:user][:working_one_rep_max][d.id.to_s]
      d.increment_ammount = params[:user][:increment_ammount][d.id.to_s]
      d.save!
    end

    current_user.setup_complete!
    redirect_to root_path
  end
end
