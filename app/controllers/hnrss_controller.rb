class HnrssController < ApplicationController
  require 'rss'
  require 'open-uri'

  BASE_URL = 'http://hnrss.org/newest'
  TAGS = ['Rails', 'Swift']

  def fetch
    tags = Array.new
    tags = params[:tag].blank? ? TAGS : tags.push(params[:tag])

    sort_param = params[:points].present? ? "&points=#{params[:points]}" : ""

    urls = tags.map { |tag| create_url_by_tag(tag) }
    feeds = urls.map { |url| fetch_feed(url + sort_param) }
    binding.pry
    render json: feeds.flatten.sort! { |a,b| b[:date] <=> a[:date] }
  end

  private

  def fetch_feed(url)
    @url = url
    # url = 'http://b.hatena.ne.jp/search/tag?q=Rails&mode=rss&sort=recent'
    ua = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36'
    rss = open(@url, 'User-Agent' => ua)
    feed = RSS::Parser.parse(rss)
    rss.close
    return feed.items.map do |i|
      { link: i.link, title: i.title, desc: i.description, date: i.pubDate }
    end
  end

  def create_url_by_tag(tag)
    return "#{BASE_URL}?q=#{tag}"
  end

  def hnrss_params
    params.permit(:tag, :points)
  end
end
