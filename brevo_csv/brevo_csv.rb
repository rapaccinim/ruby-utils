require 'csv'

input_file = "input.csv"
output_file = "brevo_import.csv"
output_headers = %w[COMPANY EMAIL PHONE ADDRESS]

def phone_formatter(phone)
  '+44' + phone.gsub(/^0|\D/,'')
end

out = File.open(output_file, 'w')
out << output_headers.to_csv
CSV.read(input_file, headers: true).each do |r|
  out << [r['COMPANY'], r['EMAIL'], phone_formatter(r['PHONE']), r['ADDRESS']].to_csv
end
out.close
