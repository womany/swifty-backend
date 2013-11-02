class RenameCommentToQuote < ActiveRecord::Migration
  def change
    rename_column :quotes, :comment, :annotation
  end
end
