class CreateFoodRegists < ActiveRecord::Migration[5.2]
  def change
    create_table :food_regists do |t|
      t.integer :user_id, null: false
      t.date :day, null: false
      t.integer :timing, null: false

      t.timestamps
    end
  end
end
