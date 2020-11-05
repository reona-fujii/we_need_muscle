class CreateFoodRegistCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :food_regist_carts do |t|
      t.integer :user_id, null: false
      t.integer :post_food_id, null: false
      t.timestamps
    end
  end
end
