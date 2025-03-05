# frozen_string_literal: true

module Mutations
  class ItemModifierGroupCreate < BaseMutation
    description "Add a itme to a item"

    field :item_modifier_group, Types::ItemModifierGroupType, null: false

    argument :item_id, ID, required: true
    argument :modifier_group_id, ID, required: true

    def resolve(item_id:, modifier_group_id:)
      item= ::Item.find_by(identifier: item_id)
      group = ::ModifierGroup.find_by(identifier: modifier_group_id)
      item_modifier_group = ItemModifierGroup.new(item:, modifier_group: group)
      raise GraphQL::ExecutionError.new "Error adding item to modifier group", extensions: item_modifier_group.errors.to_hash unless item_modifier_group.save!

      { item_modifier_group: item_modifier_group }
    end
  end
end
