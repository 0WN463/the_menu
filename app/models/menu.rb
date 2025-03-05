class Menu < ApplicationRecord
  has_many :menu_sections
  has_many :sections, through: :menu_sections

  validates :identifier, uniqueness: true
  validates :state, inclusion: { in: %w(draft published) }, presence: true
end
