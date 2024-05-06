class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.bigint :user_id, null: false, foreign_key: true
      t.bigint :diary_id, null: false, foreign_key: true
      t.timestamps
    end
    add_index :favorites, [:user_id, :diary_id], unique: :true
  end
end
