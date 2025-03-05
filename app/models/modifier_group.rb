class ModifierGroup < ApplicationRecord
  has_many :modifiers

  validates :identifier, uniqueness: true, presence: true
  validates :label, presence: true
end
