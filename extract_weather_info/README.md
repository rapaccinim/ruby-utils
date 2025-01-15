# Extract Weather Info
## About
This is a very basic Ruby script that fetches a web page in order to extract text from specific tags.

It's not possible to use this scripts in each use case, but it's a good starting point and it shows the basic logic.

The considered use case is with 2 web pages talking about UK sunny places.

## Required Gems
You need to install `open-uri` and `nokogiri`:
```
gem install open-uri nokogiri
```

### Nokogiri
`nokogiri` is a very useful gem for data scraping from an HTML page.

[Offical docs](https://nokogiri.org/index.html).

Once you've seen this script example, you can easily play with it to adapt it to specific use cases (e.g. nested elements).

## Usage
With Ruby and the required gems installed, just launch the command passing the web page URL as first argument (`ARGV[0]`) and
the specific HTML tag as second argument (`ARGV[1]`):
```
ruby data_extractor.rb "https://your-url-here" "html_tag"
```
For example:
```
ruby data_extractor.rb "https://www.weather2travel.com/uk/sunniest-places/" "h3"
```
