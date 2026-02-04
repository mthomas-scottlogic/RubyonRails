# frozen_string_literal: true

class Mutations::CreateMatchSession < Mutations::BaseMutation
  argument :opponent, String, required: true
  argument :opponentScore, Integer, required: true
  argument :ourTeam, String, required: true
  argument :score, Integer, required: true
  field :matchSession, Types::MatchSessionType, null: false
  field :errors, [ String ], null: false
  def resolve(opponent:, opponentScore:, ourTeam:, score:)
    match_session = MatchSession.new(opponent: opponent, opponent_score: opponentScore, our_team: ourTeam, score: score)
    if match_session.save
      { matchSession: match_session, errors: [] }
    else
      { matchSession: nil, errors: match_session.errors.full_messages }
    end
  end
end
