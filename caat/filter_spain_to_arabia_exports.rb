require 'csv'

rows = CSV.read("caat/eu-arms-export-data/export.csv", col_sep: "; ")
spain_to_arabia = rows.select do |row|
  (row[2] == 'ES' && row[4]=='SA')
end

puts spain_to_arabia.size

CSV.open("caat/spain_to_arabia.csv", "wb", col_sep: "; ") do |csv|
  spain_to_arabia.each do |row|
    csv << row
  end
end