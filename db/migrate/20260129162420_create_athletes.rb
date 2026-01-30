class CreateAthletes < ActiveRecord::Migration[8.1]
  def change
    create_table :athletes do |t|
      t.string :name, null: false
      t.string :initials, null: false

      t.timestamps
    end
  end
end
