class CreateCreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :create_comments do |t|
      t.text :comment
      t.integer :create_id
      t.integer :user_id

      t.timestamps
    end
  end
end
