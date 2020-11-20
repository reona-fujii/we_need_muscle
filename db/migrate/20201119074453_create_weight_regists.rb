class CreateWeightRegists < ActiveRecord::Migration[5.2]
  def change
    create_table :weight_regists do |t|
      t.integer :user_id, null: false
      t.date :day, null: false
      t.integer :weight, null: false

      t.timestamps
    end
  end
end
