# frozen_string_literal: true

module Types
  class SectionType < Types::BaseObject
    field :id, ID, null: false
    field :identifier, String
    field :label, String
    field :description, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :items, [ Types::ItemType ], null: false

    def items
      SectionItem.where(section_id: object.id).order("display_order ASC").to_a.map { |s| s.item }
    end
  end
end
