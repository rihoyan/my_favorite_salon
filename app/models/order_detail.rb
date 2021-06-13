class OrderDetail < ApplicationRecord
  belongs_to :reservation
  has_many  :menus
  enum : { good: 0, normal: 1, bad: 2 }
  {0: 最高！, 1:よかった, 2: 普通, 3: うーん ４：イマイチ ５：キャンセル}
end
