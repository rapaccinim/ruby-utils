require 'csv'

input_file = "input.csv"
output_file = "brevo_import.csv"

output_headers = %w[COMPANY EMAIL PHONE ADDRESS]

def phone_formatter(phone)
  '+44' + phone.gsub(/^0|\D/,'')
end

File.write(output_file, output_headers.to_csv, mode: 'a')

CSV.read(input_file, headers: true).each do |r|
  new_row = [r['COMPANY'], r['EMAIL'], phone_formatter(r['PHONE']), r['ADDRESS']].each(&:to_s)
  File.write(output_file, new_row.to_csv, mode: 'a')
end
