class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :typeform
      t.jsonb :answers
      t.string :token
      t.string :uid

      t.timestamps null: false
    end
  end
end
