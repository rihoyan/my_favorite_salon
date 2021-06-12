class Prefecture < ApplicationRecord
  has_many :municipalitys
  has_many :salons
end
