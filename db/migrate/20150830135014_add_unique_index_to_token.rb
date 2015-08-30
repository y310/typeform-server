class AddUniqueIndexToToken < ActiveRecord::Migration
  def change
    add_index :results, [:token], unique: true
  end
end
