class Artist < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :grammy, presence: true
end
