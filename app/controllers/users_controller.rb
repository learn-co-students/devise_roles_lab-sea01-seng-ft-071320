class UsersController < ApplicationController
  before_action :draw_user
  before_action :authorize_admin, only: [ :destroy ]

  def destroy
    @user.destroy
  end

  private

  def authorize_admin
    return head(:unauthorized) unless current_user.admin?
  end

  def draw_user
    @user = User.find(params[:id])
  end
end
