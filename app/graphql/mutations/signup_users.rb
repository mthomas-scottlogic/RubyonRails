# frozen_string_literal: true

module Mutations
  class SignupUsers < BaseMutation
    argument :name, String, required: true
    argument :email_address, String, required: true
    argument :password, String, required: true
    argument :role, Types::RoleType, required: false, default_value: "author"

    field :user, Types::UserType, null: true
    def resolve(name:, email_address:, password:, role:)
      debugger
      Rails.logger.info("Debug message: #{name.inspect}, #{email_address.inspect}, #{password.inspect}")
      user = User.new(name: name, email_address: email_address, password: password, role: role)
      if user.save
         user
      else
        raise GraphQL::ExecutionError, user.errors.full_messages.join(", ")
      end
    end
  end
end
