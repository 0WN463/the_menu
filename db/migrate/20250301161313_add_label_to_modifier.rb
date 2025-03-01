class AddLabelToModifier < ActiveRecord::Migration[8.0]
  def change
    add_column :modifiers, :label, :string
  end
end
