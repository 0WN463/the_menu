# frozen_string_literal: true

module Mutations
  class SectionItemDelete < BaseMutation
    description "Remove a item from a section"

    field :section_item, Types::SectionItemType, null: false

    argument :section_id, ID, required: true
    argument :item_id, ID, required: true

    def resolve(section_id:, item_id:)
      section = ::Menu.find_by(identifier: section_id)
      item= ::Section.find_by(identifier: item_id)
      section_item = SectionItem.find_by(section:, item:)

      if section_item == nil then
        raise GraphQL::ExecutionError.new "item is not in section"
      end

      raise GraphQL::ExecutionError.new "Error adding section to item", extensions: section_item.errors.to_hash unless section_item.destroy!

      { section_item: section_item }
    end
  end
end
