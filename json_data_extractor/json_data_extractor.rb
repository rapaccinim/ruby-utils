require 'json'
require 'csv'

# config
DATA_DIR = 'dc-prospects'
JSON_FILES_FILTER = "#{DATA_DIR}/*.json"
KEYS = ['elements', 'fullName', 'currentPositions', 'companyName', 'title', 'entityUrn'] 
LINKEDIN_URL = 'https://www.linkedin.com/in/'
REGEX = /fs_salesProfile:\(([^,]+)/
OUT_FILE = 'prospects.csv'
OUT_HEADERS = [KEYS[1], KEYS[3], KEYS[4], KEYS[5]]

def get_files
  Dir.glob(JSON_FILES_FILTER)
end

def get_elements(file)
  JSON.parse(File.read(file))[KEYS[0]]
end

def get_data(element)
  current_position = element[KEYS[2]].first
  match = element[KEYS[5]].match(REGEX)
  {
    KEYS[1] => element[KEYS[1]],
    KEYS[3] => current_position[KEYS[3]],
    KEYS[4] => current_position[KEYS[4]],
    KEYS[5] => "#{LINKEDIN_URL}#{match[1]}"
  }
end

File.open(OUT_FILE, 'w') do |out|
  out << OUT_HEADERS.to_csv
  get_files.flat_map(&method(:get_elements))
           .map(&method(:get_data))
           .each{ |prospect| out << prospect.values.to_csv}
end
