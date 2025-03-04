# frozen_string_literal: true

module Mutations
  class ModifierGroupDelete < BaseMutation
    description "Deletes a modifier_group by ID"

    field :modifier_group, Types::ModifierGroupType, null: false

    argument :identifier, ID, required: true

    def resolve(identifier:)
      modifier_group = ::ModifierGroup.find_by(identifier:identifier)

      if modifier_group == nil then
        raise GraphQL::ExecutionError.new "modifier group does not exists"
      end

      raise GraphQL::ExecutionError.new "Error deleting modifier_group", extensions: modifier_group.errors.to_hash unless modifier_group.destroy!

      { modifier_group: modifier_group }
    end
  end
end
