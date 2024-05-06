class CreateDiaries < ActiveRecord::Migration[6.1]
  def change
    create_table :diaries do |t|
      t.text :description, null: true
      t.bigint :user_id, null: false
      t.timestamps
    end
  end
end
