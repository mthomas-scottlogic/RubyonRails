class Mutations::DeleteMatchSession < Mutations::BaseMutation
  include AuthorizationHelper
  argument :id, ID, required: true

  field :success, Boolean, null: false
  field :errors, [ String ], null: false

  def resolve(id:)
    debugger

    match_session = MatchSession.find_by(id: id)
    if match_session
      authorize!(:destroy, match_session)
      match_session.destroy
      { success: true, errors: [] }
    else
      raise GraphQL::ExecutionError, "MatchSession not found"
    end
  end
end
