# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
      include GraphQL::Types::Relay::HasNodeField
      include GraphQL::Types::Relay::HasNodesField
  
      field :menus,
      [Types::MenuType],
      null: false,
      description: "Return a list of menus"
  
      def menus
        Menu.all
      end
  end
end
