module Scrapers

  class Categories < Base

    URL_PATH = '/bytovye_konditsionery/'.freeze

    class << self

      def scrapes
        page = mechanize.get("#{ROOT_URL}#{URL_PATH}")

        categories = page.parser.css('a.arr')
      end

      def scrapes_description(category)
        page = mechanize.get("#{ROOT_URL}#{category['href']}")

        description = page.parser.css('table div.redborder').first.text
      end

    end


  end

end




