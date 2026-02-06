module Mutations
  class LoginUsers < BaseMutation
    argument :email_address, String, required: true
    argument :password, String, required: true

    field :token, String, null: true
    field :errors, [ String ], null: false
    def resolve(email_address:, password:)
      debugger
      user = User.find_by(email_address: email_address.downcase.strip)
      if user&.authenticate(password)
        token = JWT.encode({ user_id: user.id }, "my-secret", "HS256")
        # session = user.sessions.create!
        {
          token: token
        }
      else

          raise GraphQL::ExecutionError, "Invalid email or password"

      end
    end
  end
end
