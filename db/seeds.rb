
#encoding: utf-8

require 'csv'

pref_row = 0
city_row = 1
pref_id = 2

CSV.foreach('db/csv/prefecture.csv') do |row|
  Prefecture.find_or_create_by!(name: row[pref_row])
end

CSV.foreach('db/csv/city.csv') do |row|
  Municipality.find_or_create_by!(city_name: row[city_row],prefecture_id: row[pref_id])
end