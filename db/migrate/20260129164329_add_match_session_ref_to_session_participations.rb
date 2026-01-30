class AddMatchSessionRefToSessionParticipations < ActiveRecord::Migration[8.1]
  def change
    # This migration is no longer needed - match_session reference is now in the create_session_participations migration
  end
end
