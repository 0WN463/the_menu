# frozen_string_literal: true

module Mutations
  class ModifierDelete < BaseMutation
    description "Remove a section from a menu"

    field :menu_section, Types::ModifierType, null: false

    argument :item_id, ID, required: true
    argument :modifier_group_id, ID, required: true

    def resolve(item_id:, modifier_group_id:)
      item = ::Item.find_by(identifier:item_id)
      group = :: ModifierGroup.find_by(identifier:modifier_group_id)
      modifier = Modifier::find_by(item:, modifier_group:group)

      if modifier == nil then
        raise GraphQL::ExecutionError.new "item is not in modifier group"
      end

      raise GraphQL::ExecutionError.new "Error removing item from modifier group", extensions: modifier.errors.to_hash unless modifier.destroy!

      {modifier: modifier}
    end
  end
end
