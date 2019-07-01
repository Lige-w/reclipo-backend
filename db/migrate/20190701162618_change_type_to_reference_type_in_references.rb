class ChangeTypeToReferenceTypeInReferences < ActiveRecord::Migration[5.2]
  def change
    rename_column :references, :type, :reference_type
  end
end
