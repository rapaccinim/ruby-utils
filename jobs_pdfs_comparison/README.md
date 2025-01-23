# Jobs-PDFs comparison
## About
Sometime I receive a list of jobs in a txt file format and I need to make sure to have also received all the related PDF documents attached.

The main comparison is based on a postcode (that acts as an identifier for both each line of a text file and each PDF file name).

For example, I have an input file like the following:
```
postcode 1
postcode2
post code3
```
And a folder contatining PDF files like:
```
./pdfs/
├── post code1.pdf
├── postcode 2.pdf
├── postcode3.pdf
├── post code4.pdf
```

## Usage
Make sure to have a TXT file for the jobs list and a folder containing PDFs.

Set the 2 variables at the beginning of the `comparison.rb` code:
```
file = "jobs.txt"
folder = "pdfs"
```
Where `file` points to the jobs file and `folder` is the directory with the PDFs.

Then run:
```
ruby comparison.rb
```
