require "test_helper"

class SectionItemTest < ActiveSupport::TestCase
  test "disallow adding existing item into section" do
    section = Section.find_by(identifier: "first_section")
    item = Item.find_by(identifier: "first_item")

    assert_raises do
      SectionItem.create(section: section, item: item)
    end
  end

  test "able to add new section into menu" do
    section = Section.find_by(identifier: "second_section")
    item = Item.find_by(identifier: "first_item")
    section_item = SectionItem.create(section: section, item: item)

    assert_includes SectionItem.all, section_item, "should be able to add new item"
  end
end
