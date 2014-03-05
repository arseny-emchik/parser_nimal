#!/usr/bin/env ruby

require 'mechanize'
require 'open-uri'

Dir[File.expand_path('../../lib/scrapers/**.rb', __FILE__)].each { |f| require(f) }


#items = Scrapers::Item.scrapes
#
#
#items.each do |i|
#  puts i
#  puts ' '*10
#end




#item['url']
#item['name']
#item['cost']
#item['category']
#item['vendor']
#item['image_link']
#item['image_url'] # localhost url
#item['characteristics']
