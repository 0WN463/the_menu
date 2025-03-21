# frozen_string_literal: true

module Mutations
  class MenuSectionCreate < BaseMutation
    description "Add a section to a menu"

    field :menu_section, Types::MenuSectionType, null: false

    argument :menu_id, ID, required: true
    argument :section_id, ID, required: true
    argument :display_order, Integer, required: false

    def resolve(menu_id:, section_id:, display_order:0)
      menu = ::Menu.find_by(identifier: menu_id)
      section= ::Section.find_by(identifier: section_id)
      menu_section = MenuSection.new(menu:, section:, display_order:)

      raise GraphQL::ExecutionError.new "Error adding menu to section", extensions: menu_section.errors.to_hash unless menu_section.save!

      { menu_section: menu_section }
    end
  end
end
