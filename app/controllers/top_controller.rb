class TopController < ApplicationController
  def index
    @hatebu = Hatebu.new
    @hnrss = Hnrss.new

    hatebu_posts = @hatebu.fetch
    hnrss_posts = @hnrss.fetch

    feeds = hatebu_posts.concat(hnrss_posts)

    render json: feeds.flatten.sort! { |a,b| b[:date] <=> a[:date] }
  end

  private

  def top_params
    params.permit(:tag, :sort, :points)
  end
end
