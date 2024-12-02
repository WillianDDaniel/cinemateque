class Player < ApplicationRecord
  validates :name, :nacionality, :birth_date, presence: true
end
