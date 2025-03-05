require "test_helper"

class MenuTest < ActiveSupport::TestCase
  test "disallow duplicate identifier" do
    menu = Menu.new(identifier: "first_menu", label: "new menu", state: "draft")
    menu.save()

    assert_not_includes Menu.all, menu, "conflicted menu should not be saved"
  end

  test "able to create menu" do
    menu = Menu.new(identifier: "other_identifier", label: "new menu", state: "draft")
    menu.save()

    assert_includes Menu.all, menu, "conflicted menu should not be saved"
  end
end
