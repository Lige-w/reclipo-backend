class RemoveFormatAndAddMediumToReferences < ActiveRecord::Migration[5.2]
  def change
    remove_column :references, :format, :string
    add_column :references, :medium, :string
  end
end
