# Storepoint Locator Data Extractor
## Use case
I need to extract some data from a [Storepoint Store Locator](https://storepoint.co/) that is embedded in a public website.
## Process
* Using the browser inspector to copy the entire HTML object `storepoint-results-container`
* Pasting the HTML object into an HTML file `input.html`
* Using the `data_extractor.rb` alongside `nokogiri` and `csv` gems to create an `output.csv` file
## Future Improvements
* Nokogiri can also parse directly from an HTTP resource, so there's no need to do the copy-pasting of the file

