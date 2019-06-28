class CreateReferenceAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :reference_authors do |t|
      t.belongs_to :author, foreign_key: true
      t.belongs_to :reference, foreign_key: true

      t.timestamps
    end
  end
end
