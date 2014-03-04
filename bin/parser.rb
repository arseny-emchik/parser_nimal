#!/usr/bin/env ruby

require 'mechanize'

Dir[File.expand_path('../../lib/scrapers/**.rb', __FILE__)].each { |f| require(f) }


items = Scrapers::Item.scrapes
puts items

#item['url']
#item['name']
#item['cost']
#item['category']
#item['vendor']
#item['image_link']
#item['characteristics']
