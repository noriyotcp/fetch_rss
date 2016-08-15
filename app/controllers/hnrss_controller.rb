class HnrssController < ApplicationController
  def fetch
    @hnrss = Hnrss.new
    feeds = @hnrss.fetch(params[:tag], params[:points])
    render json: feeds.flatten.sort! { |a,b| b[:date] <=> a[:date] }
  end

  private

  def hnrss_params
    params.permit(:tag, :points)
  end
end
