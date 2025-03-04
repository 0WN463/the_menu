require "test_helper"

class ItemTest < ActiveSupport::TestCase
  test "disallow duplicate identifier" do
    item = Item.new(identifier: "first_item", label:"first item")
    item.save()

    assert_not_includes Item.all, item, "conflicted item should not be saved"
  end
end
