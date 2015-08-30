class CreateTypeforms < ActiveRecord::Migration
  def change
    create_table :typeforms do |t|
      t.jsonb :body
      t.references :webhook
      t.string :from_url
      t.integer :from_id
      t.jsonb :form_definition

      t.timestamps null: false
    end
  end
end
