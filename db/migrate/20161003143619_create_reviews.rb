class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :product_id
      t.string :title
      t.text :description
      t.string :username
      t.date :review_date

      t.timestamps
    end
  end
end
