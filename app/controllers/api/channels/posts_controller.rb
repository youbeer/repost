class Api::Channels::PostsController < Api::ApplicationController
  before_action :set_channel

  def index
    @posts = @channel.posts
      .includes(:user)
      .with_action_by(current_user)
      .order(created_at: :desc)
      .page(params[:page])
      .per(10)
  end

  private

  def set_channel
    @channel = Channel.find(params[:channel_id])
  end
end
