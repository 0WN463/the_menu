# frozen_string_literal: true

module Mutations
  class ModifierGroupCreate < BaseMutation
    description "Creates a new modifier_group"

    field :modifier_group, Types::ModifierGroupType, null: false

    argument :identifier, String, required: true
    argument :label, String, required: true
    argument :selection_required_min, Integer, required: false
    argument :selection_required_max, Integer, required: false

    def resolve(identifier:, label:, selection_required_min:0, selection_required_max:1)
      modifier_group = ::ModifierGroup.new(identifier:, label:, selection_required_min:, selection_required_max:)
      raise GraphQL::ExecutionError.new "Error creating modifier_group", extensions: modifier_group.errors.to_hash unless modifier_group.save

      { modifier_group: modifier_group }
    end
  end
end
