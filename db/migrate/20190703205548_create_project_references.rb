class CreateProjectReferences < ActiveRecord::Migration[5.2]
  def change
    create_table :project_references do |t|
      t.belongs_to :project, foreign_key: true
      t.belongs_to :reference, foreign_key: true

      t.timestamps
    end
  end
end
