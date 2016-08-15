class Hnrss
  include ActiveModel::Model
  attr_accessor :tag, :points

  require 'rss'
  require 'open-uri'

  BASE_URL = 'http://hnrss.org/newest'

  def fetch(tag = nil, points = nil)
    return fetch_feed(BASE_URL) if tag.blank? && points.blank?

    if tag.present?
      tags = tag.split(',')
      urls = tags.map { |t| create_url_by_tag(t) }
    else
      urls = Array.new.push(create_url_by_tag)
    end

    sort_param = points.present? ? "&points=#{points}" : ""
    return urls.map { |url| fetch_feed(url + sort_param) }
  end

  private

  def fetch_feed(url)
    @url = url
    ua = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36'
    rss = open(@url, 'User-Agent' => ua)
    feed = RSS::Parser.parse(rss)
    rss.close
    return feed.items.map do |i|
      { link: i.link, title: i.title, desc: i.description, date: i.pubDate }
    end
  end

  def create_url_by_tag(tag = nil)
    return "#{BASE_URL}?q=#{tag}"
  end
end
