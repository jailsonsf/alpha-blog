class ChangeNilValue < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:articles, :status, false, 0)
  end
end
