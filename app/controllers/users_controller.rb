class UsersController < ApplicationController
  def show
    @user = User.find_by!(token: params[:id])
  end
end
