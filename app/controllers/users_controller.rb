class UsersController < ApplicationController
  def show
    @user = User.find_by!(token: params[:id])
    @user.increment_scanned_count!
  end
end
