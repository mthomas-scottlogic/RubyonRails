class SessionParticipation < ApplicationRecord
  belongs_to :athlete
  belongs_to :position
  belongs_to :match_session

  validates :athlete, :position, :match_session, presence: true
end
