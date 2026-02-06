# app/graphql/helpers/authorization_helper.rb
module AuthorizationHelper
  def authorize!(action, subject)
    ability = Ability.new(context[:current_user])
    raise GraphQL::ExecutionError, "Not authorized" unless ability.can?(action, subject)
  end
end
