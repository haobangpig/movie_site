class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string   "nickname"
      t.integer  "rate"
      t.text     "review"
      t.integer  "product_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
