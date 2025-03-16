class AddDefaultValueForDisplayOrder < ActiveRecord::Migration[8.0]
    def change
      change_column :menu_sections, :display_order, :integer, default:0
      change_column :section_items, :display_order, :integer, default:0
      change_column :modifiers, :display_order, :integer, default:0
    end
end
