# frozen_string_literal: true

module Types
  class ItemType < Types::BaseObject
    field :id, ID, null: false
    field :item_type, String
    field :identifier, String
    field :label, String
    field :description, String
    field :price, Float
    field :image_url, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :modifier_groups, [ Types::ModifierGroupType ], null: false
  end
end
