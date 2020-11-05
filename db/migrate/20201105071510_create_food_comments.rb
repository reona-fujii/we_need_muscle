class CreateFoodComments < ActiveRecord::Migration[5.2]
  def change
    create_table :food_comments do |t|
      t.integer :user_id, null: false
      t.integer :post_food_id, null: false
      t.text :comment, null: false
      t.float :rate

      t.timestamps
    end
  end
end
