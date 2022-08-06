class ChangeColumnInLists < ActiveRecord::Migration[7.0]
  def change
    change_column :lists, :name, :string, unique: true, presence: true
  end
end
