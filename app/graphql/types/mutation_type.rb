# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
   field :create_athlete, mutation: Mutations::CreateAthlete
   field :create_position, mutation: Mutations::CreatePosition
    #  field :create_match_session, mutation: Mutations::CreateMatchSession
    #  field :create_session_participation, mutation: Mutations::CreateSessionParticipation
  end
end
