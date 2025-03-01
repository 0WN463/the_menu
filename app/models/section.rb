class Section < ApplicationRecord
  has_many :items, :through => :section_items
end
