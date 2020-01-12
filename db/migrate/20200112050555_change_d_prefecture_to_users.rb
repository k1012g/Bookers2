class ChangeDPrefectureToUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :prefecture, :string
  end
end
