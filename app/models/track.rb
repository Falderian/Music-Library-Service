class Track < ApplicationRecord
  belongs_to :artist
  belongs_to :album
  validates :name, presence: true, uniqueness: true
  validates :duration, presence: true
end
