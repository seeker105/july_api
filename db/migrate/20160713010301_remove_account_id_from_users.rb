class RemoveAccountIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :account_id, :string
  end
end
