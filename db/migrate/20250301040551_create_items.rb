class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      #t.string :type TODO: temporarily removed type due to name clash
      t.string :identifier
      t.string :label
      t.string :description
      t.float :price

      t.timestamps
    end

    add_index(:items, [:identifier], unique: true)
  end
end
