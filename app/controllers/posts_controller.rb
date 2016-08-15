class PostsController < ApplicationController
  require 'rss'
  require 'open-uri'

  def fetch
    url = 'http://b.hatena.ne.jp/search/tag?q=Rails&mode=rss&sort=recent'
    ua = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36'
    rss = open(url, 'User-Agent' => ua)
    feed = RSS::Parser.parse(rss)
    rss.close
    items = feed.items.map do |i|
      { link: i.link, title: i.title, desc: i.description, date: i.dc_date }
    end
    render json: items
  end
end
