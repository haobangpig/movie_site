class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string   "title"
      t.text     "image_url"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
