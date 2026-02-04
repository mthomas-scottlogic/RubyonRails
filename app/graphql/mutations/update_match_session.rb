# frozen_string_literal: true

class Mutations::UpdateMatchSession < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :opponent, String, required: false

    field :match_session, Types::MatchSessionType, null: true
    field :errors, [ String ], null: false
    def resolve(id:, opponent: nil)
      match_session = MatchSession.find_by(id: id)
      if match_session
        match_session.update(opponent: opponent)
        { match_session: match_session, errors: [] }
      else
        { match_session: nil, errors: [ "MatchSession not found" ] }
      end
  end
end
