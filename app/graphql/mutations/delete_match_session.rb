class Mutations::DeleteMatchSession < Mutations::BaseMutation
  argument :id, ID, required: true

  field :success, Boolean, null: false
  field :errors, [ String ], null: false

  def resolve(id:)
    debugger
    raise GraphQL::ExecutionError, "Login to access" unless context[:current_user]
    raise GraphQL::ExecutionError, "Only admins can delete the blogs" unless context[:current_user].admin?
    match_session = MatchSession.find_by(id: id)
    if match_session
      match_session.destroy
      { success: true, errors: [] }
    else
      { success: false, errors: [ "MatchSession not found" ] }
    end
  end
end
