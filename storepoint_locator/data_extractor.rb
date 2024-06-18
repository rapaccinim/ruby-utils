require 'nokogiri'
require 'csv'

$parsing_rules = {
  'storepoint-name' => 'text',
  'storepoint-tags' => 'html',
  'storepoint-address' => 'html',
  'storepoint-contact storepoint-contact-website' => 'text',
  'storepoint-contact' => 'text'
}

def extract_inner_data(node)
  node.css('span').map(&:text).uniq.reject(&:empty?).join(separator = ', ')
end

def extract_location_data(location)
  hash = {}
  location.children.each do |node_child|
    class_name = node_child.attr('class')  
    hash[class_name] = node_child.inner_text if $parsing_rules[class_name] == 'text'
    hash[class_name] = extract_inner_data(node_child) if $parsing_rules[class_name] == 'html'
  end
  hash
end

def extract_data(html_input, csv_output)
  out = File.open(csv_output, 'w')
  out << $parsing_rules.keys.to_csv 
  doc = File.open(html_input) { |f| Nokogiri::HTML4(f) }
  doc.css('div.storepoint-location').each do |location|
    out << extract_location_data(location).values.to_csv
  end
  out.close
end

extract_data('input.html', 'output.csv')
