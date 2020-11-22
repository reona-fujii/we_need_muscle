class ChangeRateOfFoodComments < ActiveRecord::Migration[5.2]
  def change
    change_column :food_comments, :rate, :float, default: 0
  end
end
