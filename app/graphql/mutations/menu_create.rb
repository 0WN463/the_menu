# frozen_string_literal: true

module Mutations
  class MenuCreate < BaseMutation
    description "Creates a new menu"

    field :menu, Types::MenuType, null: false

    argument :identifier, String, required: true
    argument :label, String, required: true
    argument :state, String, required: false
    argument :start_date, GraphQL::Types::ISO8601Date, required: false
    argument :end_date, GraphQL::Types::ISO8601Date, required: false

    def resolve(identifier:, label:, state:"", start_date:nil, end_date:nil)
      menu = ::Menu.new(identifier:, label:, state:, start_date:, end_date:)
      raise GraphQL::ExecutionError.new "Error creating menu", extensions: menu.errors.to_hash unless menu.save

      { menu: menu }
    end
  end
end
