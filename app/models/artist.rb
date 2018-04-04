class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  scope :letter, -> (char) { where("name LIKE '#{char}%'") }
end
