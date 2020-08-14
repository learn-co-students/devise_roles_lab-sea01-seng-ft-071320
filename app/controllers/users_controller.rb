class UsersController < ApplicationController
  # before_action :authorize_user, only: [ :show ]
  before_action :authorize_admin, only: [ :destroy ]
  before_action :draw_user, only: [ :show, :destroy ]

  def index
    redirect_to '/' if !current_user
    @user = current_user
  end

  def show
  end

  def destroy
    @user.destroy
  end

  def unauthorized
  end

  private

  def authorize_user
    return head(:unauthorized) unless current_user.try(:admin?) || current_user.try(:id) == params[:id].to_i
  end

  def authorize_admin
    return head(:unauthorized) unless current_user.admin?
  end

  def draw_user
    @user = User.find(params[:id])
  end
end
