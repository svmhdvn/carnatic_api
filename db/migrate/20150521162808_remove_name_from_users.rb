class RemoveNameFromUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :name
    end
  end
end
