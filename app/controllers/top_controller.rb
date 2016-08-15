class TopController < ApplicationController
  def index
    @post = Post.new
    @hnrss = Hnrss.new

    posts = @post.fetch
    hnrss_posts = @hnrss.fetch

    feeds = posts.concat(hnrss_posts)

    render json: feeds.flatten.sort! { |a,b| b[:date] <=> a[:date] }
  end

  private

  def top_params
    params.permit(:tag, :sort, :points)
  end
end
