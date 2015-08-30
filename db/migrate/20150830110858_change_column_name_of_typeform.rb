class ChangeColumnNameOfTypeform < ActiveRecord::Migration
  def change
    rename_column :typeforms, :from_id, :form_id
    rename_column :typeforms, :from_url, :form_url
  end
end
