# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :add_section_to_menu, mutation: Mutations::MenuSectionCreate
    field :menu_delete, mutation: Mutations::MenuDelete
    field :menu_create, mutation: Mutations::MenuCreate

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
  end
end
