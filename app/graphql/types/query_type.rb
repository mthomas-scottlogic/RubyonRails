# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # get all athletes
    field :athletes, [ Types::AthleteType ], null: false
    def athletes
      Athlete.all
    end


    # get user id
    #
    field :athlete, Types::AthleteType, null: true do
      argument :id, ID, required: true
    end
    def athlete(id:)
      Athlete.find_by(id: id)
    end

    # get match sessions
    field :match_sessions, [ Types::MatchSessionType ], null: false
    def match_sessions
      MatchSession.all
    end

    # get match session by id
    field :match_session, Types::MatchSessionType, null: true do
      argument :id, ID, required: true
    end
    def match_session(id:)
      MatchSession.find_by(id: id)
    end

    # get session participations
    field :session_participations, [ Types::SessionParticipationType ], null: false
    def session_participations
      SessionParticipation.all
    end

    # get session participation by id
    field :session_participation, Types::SessionParticipationType, null: true do
      argument :id, ID, required: true
    end
    def session_participation(id:)
      SessionParticipation.find_by(id: id)
    end
    # get positions
    field :positions, [ Types::PositionType ], null: false
    def positions
      Position.all
    end
    # get position by id
    field :position, Types::PositionType, null: true do
      argument :id, ID, required: true
    end
    def position(id:)
      Position.find_by(id: id)
    end



    #   field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
    #     argument :id, ID, required: true, description: "ID of the object."
    #   end

    #   def node(id:)
    #     context.schema.object_from_id(id, context)
    #   end

    #   field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
    #     argument :ids, [ID], required: true, description: "IDs of the objects."
    #   end

    #   def nodes(ids:)
    #     ids.map { |id| context.schema.object_from_id(id, context) }
    #   end

    #   # Add root-level fields here.
    #   # They will be entry points for queries on your schema.

    #   # TODO: remove me
    #   field :test_field, String, null: false,
    #     description: "An example field added by the generator"
    #   def test_field
    #     "Hello World!"
    #   end
  end
end
