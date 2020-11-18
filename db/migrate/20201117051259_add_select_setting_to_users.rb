class AddSelectSettingToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :select_setting, :integer, default: 0, null: false
  end
end
