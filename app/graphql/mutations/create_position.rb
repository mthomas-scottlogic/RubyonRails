class Mutations::CreatePosition < Mutations::BaseMutation
  argument :name, String, required: true

  field :position, Types::PositionType, null: false
  field :errors, [ String ], null: false

  def resolve(name:)
    position = Position.new(name: name)
    if position.save
      { position: position, errors: [] }
    else
      { position: nil, errors: position.errors.full_messages }
    end
  end
end
