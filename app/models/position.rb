class Position < ApplicationRecord
  has_many :session_participations, dependent: :nullify

  validates :name, presence: true
end
