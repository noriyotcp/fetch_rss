class HatebuController < ApplicationController
  def fetch
    @hatebu = Hatebu.new
    feeds = @hatebu.fetch(params[:tag], params[:sort])
    render json: feeds.flatten.sort! { |a, b| b[:date] <=> a[:date] }
  end

  private

  def hatebu_params
    params.permit(:tag, :sort)
  end
end
