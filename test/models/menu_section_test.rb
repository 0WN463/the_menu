require "test_helper"

class MenuSectionTest < ActiveSupport::TestCase
  test "disallow adding existing section into menu" do
    menu = Menu.find_by(identifier: "first_menu")
    section = Section.find_by(identifier:" first_section")
    menu_section = MenuSection.create(menu: menu, section: section)

    assert_not_includes MenuSection.all,menu_section, "should not allow duplicated section to be added"
  end
end
