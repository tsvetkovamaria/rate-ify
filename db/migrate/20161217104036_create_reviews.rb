class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :place, foreign_key: true
      t.text :body
      t.decimal :grade_food
      t.decimal :grade_service
      t.decimal :grade_interior

      t.timestamps
    end
  end
end
