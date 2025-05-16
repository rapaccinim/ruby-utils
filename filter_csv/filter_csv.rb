require 'csv'

input_file = "input.csv"
output_file = "filtered.csv"

def s_cleaner(s)
  s.strip.downcase
end

keywords_string = "Asset Manager, Portfolio Manager, Hedge Fund, Bank, Broker, Asset, Portfolio,
Insurance, Insurer, Trading, Finance, Investment, Capital, Banking, Wealth Management,
Wealth, Asset Management, Private Equity, Venture Capital, FinTech, Brokerage,
Credit Union, Mortgage, Analyst, Associate, Manager, Director, VP,  Vice President,
SVP, Senior Vice President, CFO, Chief Financial Officer, Trader, Advisor, Consultant,
Underwriter, Actuary, Risk Manager, Investment Banker, Accountant, Auditor, Compliance Officer,
Partners, Financial, Securities, Trust, Investments, Group, Advisors, Associates"

keywords = keywords_string.split(',').map(&method(:s_cleaner))

columns_to_consider = ['Job Title', 'Company']

out = CSV.open(output_file, 'w')

headers = CSV.open(input_file, &:readline)

out << headers

CSV.foreach(input_file, headers: true) do |row|
  matched = columns_to_consider.any? do |col|
    cell = row[col].to_s.downcase
    keywords.any? { |term| cell.include?(term) }
  end
  out << row.fields if matched
end

out.close
