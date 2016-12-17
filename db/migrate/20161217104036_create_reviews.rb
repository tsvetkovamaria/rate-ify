class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :place, foreign_key: true
      t.text :body
      t.integer :grade_food
      t.integer :grade_service
      t.integer :grade_interior

      t.timestamps
    end
  end
end
