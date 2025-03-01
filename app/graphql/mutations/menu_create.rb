# frozen_string_literal: true

module Mutations
  class MenuCreate < BaseMutation
    description "Creates a new menu"

    field :menu, Types::MenuType, null: false

    argument :menu_input, Types::MenuInputType, required: true

    def resolve(menu_input:)
      menu = ::Menu.new(**menu_input)
      raise GraphQL::ExecutionError.new "Error creating menu", extensions: menu.errors.to_hash unless menu.save

      { menu: menu }
    end
  end
end
