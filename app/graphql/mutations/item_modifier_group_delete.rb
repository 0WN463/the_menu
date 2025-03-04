# frozen_string_literal: true

module Mutations
  class ItemModifierGroupDelete < BaseMutation
    description "Remove a modifier group from an item"

    field :modifier_group, Types::ItemModifierGroupType, null: false

    argument :modifier_group_id, ID, required: true
    argument :item_id, ID, required: true

    def resolve(modifier_group_id:, item_id:)
      group = ::ModifierGroup.find_by(identifier:modifier_group_id)
      item= ::Item.find_by(identifier:item_id)
      modifier_group = ItemModifierGroup::find_by(modifier_group:group, item:)

      if modifier_group == nil then
        raise GraphQL::ExecutionError.new "modifier group is not on item"
      end

      raise GraphQL::ExecutionError.new "Error removing modifier group from item", extensions: modifier_group.errors.to_hash unless modifier_group.destroy!

      { modifier_group: modifier_group }
    end
  end
end
