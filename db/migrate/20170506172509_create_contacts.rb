class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.belongs_to :project, index: true, foreign_key: true
      t.string :name
      t.string :number

      t.timestamps null: false
    end
  end
end
