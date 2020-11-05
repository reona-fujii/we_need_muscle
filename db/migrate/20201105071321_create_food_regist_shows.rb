class CreateFoodRegistShows < ActiveRecord::Migration[5.2]
  def change
    create_table :food_regist_shows do |t|
      t.integer :food_regist_id, null: false
      t.integer :post_food_id, null: false
      t.timestamps
    end
  end
end
