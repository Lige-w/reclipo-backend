class CreateReferences < ActiveRecord::Migration[5.2]
  def change
    create_table :references do |t|
      t.string :publish_date
      t.string :title
      t.string :publisher_location
      t.string :publisher
      t.belongs_to :project, foreign_key: true
      t.string :url
      t.string :type
      t.string :page_numbers
      t.string :volume_number
      t.string :issue_number
      t.string :format

      t.timestamps
    end
  end
end
