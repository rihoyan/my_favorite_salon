class OrderDetail < ApplicationRecord
  belongs_to :reservation
  has_many  :menus
  enum favorite_rank: { 最高！: 0, よかった: 1, 普通: 2, うーん: 3, イマイチ: 4, キャンセル: 5 }
end
