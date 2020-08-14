class PostsController < ApplicationController
  before_action :draw_post, only: [ :update ]
  before_action :authorize_vip, only: [ :update ]

  def update
    @post.update(post_params)
    redirect_to '/'
  end

  private

  def draw_post
    @post = Post.find(params[:id])
  end

  def authorize_vip
    return head(:unauthorized) unless current_user.vip? || current_user.admin?
  end

  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end
