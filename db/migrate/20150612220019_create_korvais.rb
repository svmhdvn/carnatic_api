class CreateKorvais < ActiveRecord::Migration
  def change
    create_table :korvais do |t|
      t.integer :user_id
      t.text :content
      t.integer :thalam
      t.integer :matras_after

      t.timestamps null: false
    end
  end
end
