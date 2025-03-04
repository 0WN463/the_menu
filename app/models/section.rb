class Section < ApplicationRecord
  has_many :section_items
  has_many :items, :through => :section_items

  validates :identifier, uniqueness: true
end
