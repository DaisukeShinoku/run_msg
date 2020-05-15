class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.string :maker
      t.string :link
      t.text :contents

      t.timestamps
    end
  end
end
