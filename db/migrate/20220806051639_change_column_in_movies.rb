class ChangeColumnInMovies < ActiveRecord::Migration[7.0]
  def change
    change_column :movies, :title, :string, unique: true, presence: true
    change_column :movies, :overview, :text, presence: true
  end
end
