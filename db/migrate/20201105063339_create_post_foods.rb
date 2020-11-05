class CreatePostFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :post_foods do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :food_image_id
      t.integer :calorie, null: false
      t.integer :protain, null: false
      t.integer :fat, null: false
      t.integer :carbon, null: false
      t.timestamps
    end
  end
end
