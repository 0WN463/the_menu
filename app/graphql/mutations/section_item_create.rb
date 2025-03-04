# frozen_string_literal: true

module Mutations
  class SectionItemCreate < BaseMutation
    description "Add a item to a section"

    field :section_item, Types::SectionItemType, null: false

    argument :item_id, ID, required: true
    argument :section_id, ID, required: true

    def resolve(item_id:, section_id:)
      section= ::Section.find_by(identifier:section_id)
      item = ::Item.find_by(identifier:item_id)
      section_item = SectionItem::new(item:, section:)
      raise GraphQL::ExecutionError.new "Error adding item to section", extensions: section_item.errors.to_hash unless section_item.save!

      { section_item: section_item }
    end
  end
end
