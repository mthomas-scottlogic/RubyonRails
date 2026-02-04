class Mutations::DeleteMatchSession < Mutations::BaseMutation
  argument :id, ID, required: true

  field :success, Boolean, null: false
  field :errors, [ String ], null: false

  def resolve(id:)
    match_session = MatchSession.find_by(id: id)
    if match_session
      match_session.destroy
      { success: true, errors: [] }
    else
      { success: false, errors: [ "MatchSession not found" ] }
    end
  end
end
