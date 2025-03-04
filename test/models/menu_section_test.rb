require "test_helper"

class MenuSectionTest < ActiveSupport::TestCase
  test "disallow adding existing section into menu" do
    menu = Menu.find_by(identifier: "first_menu")
    section = Section.find_by(identifier: "first_section")

    assert_raises do
      MenuSection.create(menu: menu, section: section)
    end
  end

  test "able to add new item into section" do
    menu = Menu.find_by(identifier: "first_menu")
    section = Section.find_by(identifier: "second_section")
    menu_section = MenuSection.create!(menu: menu, section: section)

    assert_includes MenuSection.all, menu_section, "should be able to add new section"
  end
end
