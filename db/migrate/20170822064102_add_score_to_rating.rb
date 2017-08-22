class AddScoreToRating < ActiveRecord::Migration[5.0]
  def change
    add_column :ratings, :score, :string
  end
end
