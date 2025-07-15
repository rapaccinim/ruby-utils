require 'json'
require 'csv'

# config
data_dir = 'dc-prospects'
json_files_filter = "#{data_dir}/*.json"
hash_keys = ['elements', 'fullName', 'currentPositions', 'companyName', 'title', 'entityUrn'] 
linkedin_URL = 'https://www.linkedin.com/in/'
regex = /fs_salesProfile:\(([^,]+)/
out_file = 'prospects.csv'

# getting prospects
prospects = Dir.glob(json_files_filter).flat_map do |file|
  JSON.parse(File.read(file))[hash_keys[0]].map do |element|
    current_position = element[hash_keys[2]].first
    match = element[hash_keys[5]].match(regex)
    {
      hash_keys[1] => element[hash_keys[1]],
      hash_keys[3] => current_position[hash_keys[3]],
      hash_keys[4] => current_position[hash_keys[4]],
      hash_keys[5] => "#{linkedin_URL}#{match[1]}"
    }
  end
end

out = File.open(out_file, 'w')
out << prospects.first.keys.to_csv
prospects.each { |prospect| out << prospect.values.to_csv }
p prospects.count

out.close
