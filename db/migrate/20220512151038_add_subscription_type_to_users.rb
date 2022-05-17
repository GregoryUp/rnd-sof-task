class AddSubscriptionTypeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :subscription_type, :string, default: "weekly"
  end
end
