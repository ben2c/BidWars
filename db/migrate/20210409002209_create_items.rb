class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.belongs_to :user, foreign_key: true
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
