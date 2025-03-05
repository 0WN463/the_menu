# frozen_string_literal: true

module Mutations
  class MenuSectionDelete < BaseMutation
    description "Remove a section from a menu"

    field :menu_section, Types::MenuSectionType, null: false

    argument :menu_id, ID, required: true
    argument :section_id, ID, required: true

    def resolve(menu_id:, section_id:)
      menu = ::Menu.find_by(identifier: menu_id)
      section= ::Section.find_by(identifier: section_id)
      menu_section = MenuSection.find_by(menu:, section:)

      if menu_section == nil then
        raise GraphQL::ExecutionError.new "section is not in menu"
      end

      raise GraphQL::ExecutionError.new "Error adding menu to section", extensions: menu_section.errors.to_hash unless menu_section.destroy!

      { menu_section: menu_section }
    end
  end
end
