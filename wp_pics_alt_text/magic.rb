#!/usr/bin/env ruby

TO_REMOVE = ['png', 'jpg', 'jpeg', 'svg', '.']

def remove_chars(s)
  return STDERR.puts "Specify the file name as ARG1" if s.nil? 
  p s.gsub(/-|_/, ' ')
     .gsub(Regexp.union(TO_REMOVE), '')
     .strip
end

remove_chars(ARGV[0])
