# frozen_string_literal: true

module Mutations
  class SectionCreate < BaseMutation
    description "Creates a new section"

    field :section, Types::SectionType, null: false

    argument :identifier, String, required: true
    argument :label, String, required: true
    argument :description, String, required: false

    def resolve(identifier:, label:, description:"")
      section = ::Section.new(identifier:, label:, description:)

      if section == nil then
        raise GraphQL::ExecutionError.new "section does not exists"
      end

      raise GraphQL::ExecutionError.new "Error creating section", extensions: section.errors.to_hash unless section.save

      { section: section}
    end
  end
end
