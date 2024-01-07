class CreateConections < ActiveRecord::Migration[7.0]
  def change
    create_table :conections do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :connected_user_id
      t.string :status

      t.timestamps
    end
  end
end
