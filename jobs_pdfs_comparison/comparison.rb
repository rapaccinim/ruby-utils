file = "jobs.txt"
folder = "pdfs"

jobs = File.readlines(file, chomp:true)
           .map { |j| j.gsub(/\s+/, "") }

pdfs = Dir.glob("#{folder}/*.pdf")
          .map { |p| File.basename(p, ".pdf")
          .gsub(/\s+/, "") }

p "Jobs list", jobs
p "Downloaded PDFs", pdfs
p "Missing PDFs:", jobs - pdfs
