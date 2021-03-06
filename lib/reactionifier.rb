require 'net/http'
require 'nokogiri'

# Scrapes GIFs from reactiongifs.com

module Reactionifier

  VERSION = '0.0.2'

  class Reactionifier

    def reaction_gif(mood)
      reaction_gifs(mood).sample
    end

    def reaction_gifs(mood)
      html = Nokogiri::HTML(fetch_html(mood))
      imgs = html.css('.entry img')
      imgs.map { |img| img.attribute('src').value }
    end

    def fetch_html(mood)
      url = URI.parse(build_url(mood))
      Net::HTTP.get(url.host, url.request_uri)
    end

    def build_url(mood)
      "http://www.reactiongifs.com/?submit=Search&s=#{URI::encode(mood)}"
    end
  end
end
