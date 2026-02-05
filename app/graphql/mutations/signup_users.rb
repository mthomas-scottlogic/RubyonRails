# frozen_string_literal: true

module Mutations
  class SignupUsers < BaseMutation
    argument :name, String, required: true
    argument :email_address, String, required: true
    argument :password, String, required: true
    field :user, Types::UserType, null: true
    field :errors, [ String ], null: false
    def resolve(name:, email_address:, password:, role: "author")
      debugger
      Rails.logger.info("Debug message: #{name.inspect}, #{email_address.inspect}, #{password.inspect}")
      user = User.new(name: name, email_address: email_address, password: password, role: role)
      if user.save
        { user: user, errors: [] }
      else
        { user: nil, errors: user.errors.full_messages }
      end
    end
  end
end
