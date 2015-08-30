class ChangeTypeofFormId < ActiveRecord::Migration
  def change
    change_column :typeforms, :form_id, :string
  end
end
