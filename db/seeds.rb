# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

menus = {"カット"=>60,"カラー"=>90,"パーマ"=>90,"縮毛矯正"=>60,"トリートメント"=>60,"ヘッドスパ"=>40,"ヘアセット"=>30,"エクステ"=>90}
menus.each do |menu_name, menu_time|
  Menu.create(name: menu_name, time: menu_time)
end