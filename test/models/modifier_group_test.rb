require "test_helper"

class ModifierGroupTest < ActiveSupport::TestCase
  test "disallow duplicate identifier" do
    group = ModifierGroup.new(identifier: "first_group", label:"first group")
    group.save()

    assert_not_includes ModifierGroup.all, group, "conflicted group should not be saved"
  end
end
