class Records < ActiveRecord::Migration[5.2]
  def change
    drop_table :weight_regists do |t|
      t.integer "user_id", null: false
      t.date "day", null: false
      t.integer "weight", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
