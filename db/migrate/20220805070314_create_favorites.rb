class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.text :comment
      t.integer :user_id
      t.integer :create_id

      t.timestamps
    end
  end
end
