# frozen_string_literal: true

module Mutations
  class ItemCreate < BaseMutation
    description "Creates a new item"

    field :item, Types::ItemType, null: false

    argument :identifier, String, required: true
    argument :label, String, required: true
    argument :item_type, String, required: false
    argument :description, String, required: false
    argument :price, Float, required: false
    argument :image_url, String, required: false

    def resolve(identifier:, label:, item_type: "product", description: "", price: 0, image_url:"")
      if item_type != "product" && item_type != "component" then
        raise GraphQL::ExecutionError.new "invalid item type"
      end

      item = ::Item.new(identifier:, label:, item_type:, description:, price:, image_url:)

      raise GraphQL::ExecutionError.new "Error creating item", extensions: item.errors.to_hash unless item.save

      { item: item }
    end
  end
end
