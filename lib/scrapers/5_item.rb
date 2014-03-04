module Scrapers

  class Item < Base

    class << self

      def scrapes
        products = Products.scrapes

        arr_items = []

        products.each do |p|
          arr_items << scrapes_products(p)
        end

        arr_items
      end

      private

      def scrapes_products(product)
        page = mechanize.get("#{ROOT_URL}#{product['item_path']}")

        my_hash = Hash.new

        my_hash['url'] = "#{ROOT_URL}#{product['item_path']}"
        my_hash['name'] = page.parser.css('table.grid h1').text.strip
        my_hash['cost'] = page.parser.css('table.gridsm td.red').text.scan(/^[0-9]+/).first.to_i*DOLLAR_RATE
        my_hash['category'] = product['category']
        my_hash['vendor'] = product['vendor']


        image_url = page.parser.css('table.bgray img').first['src']
        my_hash['image_link'] = "#{ROOT_URL}#{image_url}"

        characteristics = page.parser.css('table.techs2 td')

        arr_characteristics = []

        characteristics.each do |c|
          ch = c
          arr_characteristics << c.text.strip unless ch.to_s.include?('<b>')
        end


        hash_characteristics = Hash.new

        arr_characteristics.each_slice(2) do |c_field, c_value|
          hash_characteristics["#{c_field}"] = c_value
        end

        my_hash['characteristics'] = hash_characteristics

        my_hash
      end

    end

  end

end
