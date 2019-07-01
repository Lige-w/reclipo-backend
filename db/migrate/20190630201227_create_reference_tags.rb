class CreateReferenceTags < ActiveRecord::Migration[5.2]
  def change
    create_table :reference_tags do |t|
      t.belongs_to :reference, foreign_key: true
      t.belongs_to :tag, foreign_key: true

      t.timestamps
    end
  end
end
