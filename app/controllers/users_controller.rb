class UsersController < ApplicationController
  def setup_complete
    current_user.setup = true
    current_user.save
    redirect_to root_path
  end
end
