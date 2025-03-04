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

      field :sections,
      [Types::SectionType],
      null: false,
      description: "Return a list of sections"
  
      def sections
        Section.all
      end

      field :items,
      [Types::ItemType],
      null: false,
      description: "Return a list of items"
  
      def items
         Item.all
      end

      field :modifier_groups,
      [Types::ModifierGroupType],
      null: false,
      description: "Return a list of modifier groups"
  
      def modifier_groups
         ModifierGroup.all
      end
  end
end
