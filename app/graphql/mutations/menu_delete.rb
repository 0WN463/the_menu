# frozen_string_literal: true

module Mutations
  class MenuDelete < BaseMutation
    description "Deletes a menu by ID"

    field :menu, Types::MenuType, null: false

    argument :identifier, ID, required: true

    def resolve(identifier:)
      menu = ::Menu.find_by(identifier:identifier)
      if menu == nil then
        raise GraphQL::ExecutionError.new "menu does not exists"
      end

      raise GraphQL::ExecutionError.new "Error deleting menu", extensions: menu.errors.to_hash unless menu.destroy!

      { menu: menu }
    end
  end
end
