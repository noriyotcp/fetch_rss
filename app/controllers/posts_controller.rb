class PostsController < ApplicationController
  def fetch
    @post = Post.new
    feeds = @post.fetch(params[:tag], params[:sort])
    render json: feeds.flatten.sort! { |a,b| b[:date] <=> a[:date] }
  end

  private

  def post_params
    params.permit(:tag, :sort)
  end
end
