module Scrapers

  class Products < Base

    class << self

      def scrapes
        subcategories = Subcategories.scrapes

        arr_products = []

        subcategories.each do |s|
          arr_products += scrapes_vendors(s)
        end

        arr_products
      end

      private

      def scrapes_vendors(subcategory)
        page = mechanize.get("#{ROOT_URL}#{subcategory['subcategory_path']}")

        arr_products = []

        products = page.parser.css('div.table-link tr td a') | page.parser.css('p.name a')

        products.each do |p|
          my_hash = Hash.new
          my_hash['category'] = subcategory['category']

          if subcategory['subcategory_name'].scan(/[a-zA-zА]+ [a-zA-zА]+/).empty?
            my_hash['vendor'] =  subcategory['subcategory_name'].scan(/[a-zA-zА]+/)
          else
            my_hash['vendor'] = subcategory['subcategory_name'].scan(/[a-zA-zА]+ [a-zA-zА]+/)
          end

          my_hash['item_path'] = p['href']

          arr_products << my_hash
        end

        arr_products
      end

    end

  end

end

