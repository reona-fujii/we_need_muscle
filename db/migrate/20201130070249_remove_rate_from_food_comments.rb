class RemoveRateFromFoodComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :food_comments, :rate, :float, default: 0
  end
end
