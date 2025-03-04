require "test_helper"

class ModifierTest < ActiveSupport::TestCase
  test "disallow adding existing item into modifier_group" do
    item = Item.find_by(identifier: "first_item")
    group = ModifierGroup.find_by(identifier: "first_group")

    assert_raises do
       Modifier.create(modifier_group: group, item: item)
    end
  end

  test "able to add new item into modifier_group" do
    item = Item.find_by(identifier: "second_item")
    group = ModifierGroup.find_by(identifier: "first_group")
    modifier = Modifier.create!(modifier_group: group, item: item)

    assert_includes Modifier.all, modifier, "should be able to add new item to modifier_group"
  end
end
