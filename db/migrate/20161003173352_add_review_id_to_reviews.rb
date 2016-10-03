class AddReviewIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :review_id, :integer, index: true
  end
end
