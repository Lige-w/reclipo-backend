class AddJournalToReferences < ActiveRecord::Migration[5.2]
  def change
    add_column :references, :journal, :string
  end
end
