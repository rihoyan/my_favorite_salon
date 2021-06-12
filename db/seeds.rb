
#encoding: utf-8

menus = {"カット"=>60,"カラー"=>90,"パーマ"=>90,"縮毛矯正"=>60,"トリートメント"=>60,"ヘッドスパ"=>40,"ヘアセット"=>30,"エクステ"=>90}
menus.each do |menu_name, menu_time|
  Menu.find_or_create_by(name: menu_name, time: menu_time)
end

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