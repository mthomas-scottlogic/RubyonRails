# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :login_users, mutation: Mutations::LoginUsers
    field :signup_users, mutation: Mutations::SignupUsers


    field :create_athlete, mutation: Mutations::CreateAthlete
    field :create_position, mutation: Mutations::CreatePosition
    field :create_match_session, mutation: Mutations::CreateMatchSession
    field :update_match_session, mutation: Mutations::UpdateMatchSession
    field :delete_match_session, mutation: Mutations::DeleteMatchSession
  end
end
