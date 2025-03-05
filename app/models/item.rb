class Item < ApplicationRecord
  has_many :item_modifier_groups
  has_many :modifier_groups, through: :item_modifier_groups

  validates :identifier, uniqueness: true, presence: true
  validates :label, presence: true
  validates :item_type, inclusion: { in: %w(component product) }, presence: true
end
