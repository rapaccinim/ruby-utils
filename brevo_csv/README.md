# brevo_csv
## Background
I have a CSV file that needs to be formatted for [Brevo](https://www.brevo.com/) (email campaign tool).

This is an example of a row from the `input.csv` file:
```text
ABC Ltd,"50 Main Strett, Bowness",056987 55657,info@abc-ltd.co.uk,
```
The `input.csv` file has the following headers:
```text
COMPANY,ADDRESS,PHONE,EMAIL
```

Brevo requires:
* each field to be a string
* `PHONE` attribute to be starting with the `+` sign and the country code (e.g. `44`)

## About this program
This little utility reads the `input.csv` and writes an `brevo_import.csv` file, applying the right formatting.

The `brevo_import.csv` file will contain the following headers:
```text
COMPANY,EMAIL,PHONE,ADDRESS
```
So the program will do the right mapping from the `input.csv`
