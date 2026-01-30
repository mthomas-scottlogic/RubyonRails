class Athlete < ApplicationRecord
  has_many :session_participations, dependent: :nullify

  validates :name, presence: true
  validates :initials, presence: true
end
