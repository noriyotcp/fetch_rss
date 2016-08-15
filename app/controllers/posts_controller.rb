class PostsController < ApplicationController
  require 'rss'
  require 'open-uri'

  # before_action :fetch_feed, only: [:fetch]
  BASE_URL = 'http://b.hatena.ne.jp/search/tag'
  TAGS = ['Rails', 'Swift']
  SORT_BY = { recent: 'recent', popular: 'popular' }

  def fetch
    urls = TAGS.map { |tag| create_url_by_tag(tag) }
    feeds = urls.map { |url| fetch_feed(url) }
    render json: feeds.flatten.sort! { |a,b| b[:date] <=> a[:date] }
  end

  def fetch_by_recent
    urls = TAGS.map { |tag| create_url_by_tag(tag) }
    feeds = urls.map { |url| fetch_feed(url+"&sort={SORT_BY[:recent}") }
    render json: feeds.flatten.sort! { |a,b| b[:date] <=> a[:date] }
  end

  def fetch_by_popular
    urls = TAGS.map { |tag| create_url_by_tag(tag) }
    feeds = urls.map { |url| fetch_feed(url+"&sort={SORT_BY[:popular}") }
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
      { link: i.link, title: i.title, desc: i.description, date: i.dc_date }
    end
  end

  def create_url_by_tag(tag)
    return "#{BASE_URL}?q=#{tag}&mode=rss"
  end
end
