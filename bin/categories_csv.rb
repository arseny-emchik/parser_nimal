#!/usr/bin/env ruby

require 'mechanize'
require 'open-uri'

Dir[File.expand_path('../../lib/scrapers/**.rb', __FILE__)].each { |f| require(f) }


def get(parent_directory_name)
  categories = Scrapers::Categories.scrapes

  arr_categories = []

  categories.each_with_index do |c, index|
    my_hash = Hash.new
    my_hash['id'] = index.to_s
    my_hash['active'] = '1'
    my_hash['name'] = c.text
    my_hash['parent_name'] = parent_directory_name.to_s
    my_hash['root'] = '0'
    my_hash['description'] = Scrapers::Categories.scrapes_description(c).to_s

    arr_categories << my_hash
  end

  arr_categories
end


arr_categories = get('Бытовые кондиционеры')

Dir.mkdir 'result' unless Dir.exist?('result')
file = File.open("result/categories.csv", "w")
file.puts('ID;Active;Name;Parent directory;Root?;Description')

arr_categories.each do |c|
  csv = ''
  csv << c['id'] << ';'
  csv << c['active'] << ';'
  csv << c['name'] << ';'
  csv << c['parent_name'] << ';'
  csv << c['root'] << ';'
  csv << c['description']
  file.puts csv
end




