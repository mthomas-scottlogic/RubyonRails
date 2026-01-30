# frozen_string_literal: true

module Types
  class MatchSessionType < Types::BaseObject
    field :id, ID, null: false
    field :startTime, String
    field :score, Integer
    field :opponentScore, Integer
    field :opponent, String
    field :our_team, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :session_participations, [ Types::SessionParticipationType ], null: true
    def session_participations
      SessionParticipation.where(match_session_id: object.id)
    end
  end
end
