class Menu < ApplicationRecord
  has_many :menu_sections
  has_many :sections, through: :menu_sections

  validates :identifier, uniqueness: true, presence: true
  validates :label, presence: true
  validates :state, inclusion: { in: %w(draft published) }, presence: true
end
