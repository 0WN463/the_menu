require "test_helper"

class ItemTest < ActiveSupport::TestCase
  test "disallow duplicate identifier" do
    item = Item.new(identifier: "first_item", label:"first item")
    item.save()

    assert_not_includes Item.all, item, "conflicted item should not be saved"
  end

  test "able to create item" do
    item = Item.new(identifier: "new_item", label:"new item")
    item.save()

    assert_includes Item.all, item, "conflicted item should not be saved"
  end
end
