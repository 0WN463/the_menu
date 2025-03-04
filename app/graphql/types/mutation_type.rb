# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :menu_create, mutation: Mutations::MenuCreate
    field :menu_delete, mutation: Mutations::MenuDelete

    field :add_section_to_menu, mutation: Mutations::MenuSectionCreate
    field :remove_section_from_menu, mutation: Mutations::MenuSectionDelete

    field :section_create, mutation: Mutations::SectionCreate
    field :section_delete, mutation: Mutations::SectionDelete

    field :add_item_to_section, mutation: Mutations::SectionItemCreate
    field :remove_item_from_section, mutation: Mutations::SectionItemDelete

    field :item_create, mutation: Mutations::ItemCreate
    field :item_delete, mutation: Mutations::ItemDelete

    field :add_modifier_group_to_item, mutation: Mutations::ItemModifierGroupCreate
    field :remove_modifier_group_from_item, mutation: Mutations::ItemModifierGroupDelete

    field :modifier_group_create, mutation: Mutations::ModifierGroupCreate
    field :modifier_group_delete, mutation: Mutations::ModifierGroupDelete

    field :add_modifier_to_modifier_group, mutation: Mutations::ModifierCreate
    field :remove_modifier_from_modifier_group, mutation: Mutations::ModifierDelete
  end
end
