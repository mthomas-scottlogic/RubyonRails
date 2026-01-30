class CreateSessionParticipations < ActiveRecord::Migration[8.1]
  def change
    create_table :session_participations do |t|
      t.boolean :startingSquad
      t.references :athlete, null: false, foreign_key: true
      t.references :position, null: false, foreign_key: true
      t.references :match_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
