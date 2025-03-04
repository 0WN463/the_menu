# frozen_string_literal: true

module Mutations
  class ModifierCreate < BaseMutation
    description "Add a section to a menu"

    field :menu_section, Types::ModifierType, null: false

    argument :item_id, String
    argument :modifier_group_id, String
    argument :display_order, Integer, required: false
    argument :default_quantity, Integer, required: false
    argument :price_override, Float, required: false

    def resolve(item_id:, modifier_group_id:, display_order:0, default_quantity:1, price_override:nil)
      item = ::Item.find_by(identifier:item_id)
      group = :: ModifierGroup.find_by(identifier:modifier_group_id)
      modifier = Modifier::new(item:, modifier_group:group)
      raise GraphQL::ExecutionError.new "Error adding modifier to group", extensions: modifier.errors.to_hash unless modifier.save!

      { modifier:  modifier}
    end
  end
end
