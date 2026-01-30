class Mutations::CreateAthlete < Mutations::BaseMutation
  argument :name, String, required: true
  argument :initials, String, required: true

  field :athlete, Types::AthleteType, null: false
  field :errors, [ String ], null: false

  def resolve(name:, initials:)
    athlete = Athlete.new(name: name, initials: initials)
    if athlete.save
      { athlete: athlete, errors: [] }
    else
      { athlete: nil, errors: athlete.errors.full_messages }
    end
  end
end
