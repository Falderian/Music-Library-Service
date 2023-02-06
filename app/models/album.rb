class Album < ApplicationRecord
  belongs_to :artist
  validates :name, presence: true
  validates :year, presence: true
end
