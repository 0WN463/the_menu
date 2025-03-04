class ModifierGroup < ApplicationRecord
  has_many :modifiers

  validates :identifier, uniqueness: true
end
