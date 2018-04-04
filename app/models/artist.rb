class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  scope :by_first_letter, -> (letter) { where("name LIKE '#{letter}%'") }
end
