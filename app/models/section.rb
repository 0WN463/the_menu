class Section < ApplicationRecord
  has_many :section_items
  has_many :items, through: :section_items

  validates :identifier, uniqueness: true, presence: true
  validates :label, presence: true
end
