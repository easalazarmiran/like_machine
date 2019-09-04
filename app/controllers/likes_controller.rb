class LikesController < ApplicationController

  def create
    like = Like.find_or_initialize_by(user_id: current_user.id, link_id: like_params[:link_id])
    if like.save
      # ActionCable.server.broadcast 'likes',
      #   link_id: like.link_id
      head :ok
    else
      render json: { errors: like.errors.messages }, status: :unprocessable_entity
    end
  end

  def destroy
    like = Like.find_by(link_id: params[:id], user_id: current_user.id)
    like.destroy!
    render json: { messages: 'Like destroyed' }, status: :ok

  rescue => e
    render json: { messages: e.messages }, status: :unprocessable_entity
  end

  private

  def like_params
    params.permit(:link_id)
  end
end
