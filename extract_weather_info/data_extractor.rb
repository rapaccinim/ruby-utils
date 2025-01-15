#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

def get_data(url, html_tag)
  return STDERR.puts "Specify url as ARG1 and html_tag as ARG2" if url.nil? || html_tag.nil? 
  Nokogiri::HTML(URI.open(url)).css(html_tag).each { |n| p n.text if !n.content.empty? }
  p "---"
end

get_data(ARGV[0], ARGV[1])
