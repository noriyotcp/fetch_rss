class Hatebu
  include ActiveModel::Model
  attr_accessor :tag, :sort

  require 'rss'
  require 'open-uri'

  HOTENTRY_URL = 'http://b.hatena.ne.jp/hotentry/it.rss'
  BASE_URL = 'http://b.hatena.ne.jp/search/tag'

  def fetch(tag = nil, sort = nil)
    return fetch_feed(HOTENTRY_URL) if tag.blank?

    tags = tag.split(',')

    sort_param = sort.present? ? "&sort=#{sort}" : ""

    urls = tags.map { |t| create_url_by_tag(t) }

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
      { link: i.link, title: i.title, desc: i.description, date: i.dc_date }
    end
  end

  def create_url_by_tag(tag)
    return "#{BASE_URL}?q=#{tag}&mode=rss"
  end
end