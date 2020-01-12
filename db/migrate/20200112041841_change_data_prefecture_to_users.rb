class ChangeDataPrefectureToUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :prefecture, :integer
  end
end
