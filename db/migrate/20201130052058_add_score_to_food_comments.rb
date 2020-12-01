class AddScoreToFoodComments < ActiveRecord::Migration[5.2]
  def change
    add_column :food_comments, :score, :decimal, precision: 3, scale: 2
  end
end
