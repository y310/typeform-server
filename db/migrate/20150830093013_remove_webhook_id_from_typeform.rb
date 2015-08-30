class RemoveWebhookIdFromTypeform < ActiveRecord::Migration
  def change
    remove_column :typeforms, :webhook_id
  end
end
