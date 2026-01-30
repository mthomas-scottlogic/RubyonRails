class CreateMatchSessions < ActiveRecord::Migration[8.1]
  def change
    create_table :match_sessions do |t|
      t.string :startTime
      t.integer :score
      t.integer :opponentScore
      t.string :opponent
      t.string :our_team

      t.timestamps
    end
  end
end
