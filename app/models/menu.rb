class Menu < ApplicationRecord
  has_many :sections, :through => :menu_sections
end
