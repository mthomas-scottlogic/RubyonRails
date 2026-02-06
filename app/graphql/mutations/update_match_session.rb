# frozen_string_literal: true

class Mutations::UpdateMatchSession < Mutations::BaseMutation
    include AuthorizationHelper
    argument :id, ID, required: true
    argument :opponent, String, required: false

    field :match_session, Types::MatchSessionType, null: true


    def resolve(id:, opponent:)
      match_session = MatchSession.find_by(id: id)

      if match_session
        authorize!(:update, match_session)
        match_session.update(opponent: opponent)
        match_session
      else
        raise GraphQL::ExecutionError, "MatchSession not found"
      end
  end
end
