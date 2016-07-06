class AddDocumentsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :documents, :json
  end
end
