class RemoveProjectIdFromReferences < ActiveRecord::Migration[5.2]
  def change
    remove_column :references, :project_id
  end
end
