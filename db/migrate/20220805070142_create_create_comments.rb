class CreateCreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :create_comments do |t|


      t.timestamps
    end
  end
end
