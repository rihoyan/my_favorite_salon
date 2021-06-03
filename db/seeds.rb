# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

menus = {"カット"=>60,"カラー"=>90,"パーマ"=>90,"縮毛矯正"=>60,"トリートメント"=>60,"ヘッドスパ"=>40,"ヘアセット"=>30,"エクステ"=>90}
menus.each do |menu_name, menu_time|
  Menu.find_or_create_by(name: menu_name, time: menu_time)
end

#require 'csv'

#pref_row = 6
#city_row = 7

#CSV.foreach('db/KEN_ALL.CSV', encoding: "Shift_JIS:UTF-8", headers: true, skip_blanks: true) do |row|
    #pref = Prefecture.find_or_create_by(name: row[pref_row])
    #Municipality.find_or_create_by(city_name: row[city_row], prefecture_id: pref.id)
#end

require 'csv'

# 都道府県・市区町村CSVを読み込みテーブルに保存
CSV.foreach('db/zenkoku.csv', encoding: "Shift_JIS:UTF-8") do |row|
    pref_name = row[7]
    city_name = row[9]
    pref = Prefecture.find_or_create_by(:name => pref_name)
    Municipality.find_or_create_by(:city_name => city_name, prefecture_id: pref.id)
end