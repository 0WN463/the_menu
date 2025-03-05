require "test_helper"

class MenuTest < ActiveSupport::TestCase
  test "disallow duplicate identifier" do
    menu = Menu.new(identifier: "first_menu", label: "new menu", state: "draft")
    menu.save()

    assert_not_includes Menu.all, menu, "conflicted menu should not be saved"
  end

  test "disallow to create menu with invalid state" do
    menu = Menu.new(identifier: "other_identifier", label: "new menu", state: "invalid")
    menu.save()

    assert_not_includes Menu.all, menu, "conflicted menu should not be saved"
  end

  test "able to create menu" do
    menu = Menu.new(identifier: "other_identifier", label: "new menu", state: "draft")
    menu.save()

    assert_includes Menu.all, menu, "conflicted menu should not be saved"
  end

  test "unable to delete 'attached' menu" do
    menu = Menu.find_by(identifier: "first_menu")

    assert_raises "menu should not be deleted" do
      menu.delete()
    end
  end

  test "able to delete 'free' menu" do
    menu = Menu.find_by(identifier: "free_menu")
    menu.delete()

    assert_not_includes Menu.all, menu, "menu should be deleted"
  end
end
