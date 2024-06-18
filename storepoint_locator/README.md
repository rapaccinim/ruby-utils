# Storepoint Locator Data Extractor
## Use case
I need to extract some data from a [Storepoint Store Locator](https://storepoint.co/) that is embedded in a public website.
## Process
* Using the browser inspector to copy the entire HTML object `storepoint-results-container`
* Pasting the HTML object into an HTML file `input.html`
* Using the `data_extractor.rb` program to create an `output.csv` file
## Future Improvements
* It might be better to have a proper data scraper and parser, but for now I just want to 'go fast' without too much atuomation
 
