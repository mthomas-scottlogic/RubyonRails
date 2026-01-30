# frozen_string_literal: true

module Types
  class SessionParticipationType < Types::BaseObject
    field :id, ID, null: false
    field :startingSquad, Boolean
    field :athlete_id, Integer, null: false
    field :position_id, Integer, null: false
    field :match_session_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :athlete, Types::AthleteType, null: true
    def athlete
      Athlete.find_by(id: object.athlete_id)
    end
    field :position, Types::PositionType, null: true
    def position
      Position.find_by(id: object.position_id)
    end
  end
end
