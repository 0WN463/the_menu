# frozen_string_literal: true

module Mutations
  class MenuDelete < BaseMutation
    description "Deletes a menu by ID"

    field :menu, Types::MenuType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      menu = ::Menu.find(id)
      raise GraphQL::ExecutionError.new "Error deleting menu", extensions: menu.errors.to_hash unless menu.destroy!

      { menu: menu }
    end
  end
end
