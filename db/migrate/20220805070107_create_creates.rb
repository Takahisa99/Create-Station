class CreateCreates < ActiveRecord::Migration[6.1]
  def change
    create_table :creates do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.string :name, null: false
      t.text :introduction, null: false
      t.timestamps
    end
  end
end
