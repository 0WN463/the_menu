# frozen_string_literal: true

module Mutations
  class ItemDelete < BaseMutation
    description "Deletes a item by ID"

    field :item, Types::ItemType, null: false

    argument :identifier, ID, required: true

    def resolve(identifier:)
      item = ::Item.find_by(identifier: identifier)

      if item == nil then
        raise GraphQL::ExecutionError.new "item does not exists"
      end

      raise GraphQL::ExecutionError.new "Error deleting item", extensions: item.errors.to_hash unless item.destroy!

      { item: item }
    end
  end
end
