class AddIndexUserIdToArticles < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :articles, :users, column: :user_id
  end
end
