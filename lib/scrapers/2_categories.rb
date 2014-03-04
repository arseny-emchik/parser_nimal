module Scrapers

  class Categories < Base

    URL_PATH = '/bytovye_konditsionery/'.freeze

      def self.scrapes
        page = mechanize.get("#{ROOT_URL}#{URL_PATH}")

        categories = page.parser.css('a.arr')
      end

  end

end




