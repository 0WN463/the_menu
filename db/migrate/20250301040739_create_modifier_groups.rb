class CreateModifierGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :modifier_groups do |t|
      t.string :identifier
      t.string :label
      t.integer :selection_required_min
      t.integer :selection_required_max

      t.timestamps
    end

    add_index(:menus, [ :identifier ], unique: true)
  end
end
