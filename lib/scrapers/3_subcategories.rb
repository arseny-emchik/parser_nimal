module Scrapers
  class Subcategories < Base

    class << self

      def scrapes
        categories = Categories.scrapes

        arr_subcategories = []

        categories.each do |c|
          arr_subcategories += scrapes_subcategories(c)
        end

        arr_subcategories
      end

      private

      def scrapes_subcategories (category)
        page = mechanize.get("#{ROOT_URL}#{category['href']}")

        arr_subcategories =[]

        subcategories = page.parser.css('a.arr').each do |s|
          my_hash = Hash.new
          my_hash['subcategory_path'] = s['href']
          my_hash['subcategory_name'] = s.text
          my_hash['category'] = category.text
          arr_subcategories << my_hash
        end

        arr_subcategories
      end


    end

  end

end