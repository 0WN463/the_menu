require "test_helper"

class SectionTest < ActiveSupport::TestCase
  test "disallow duplicate identifier" do
    section= Section.new(identifier: "first_section", label: "new section")
    section.save()

    assert_not_includes Section.all, section, "conflicted section should not be saved"
  end

  test "able to create section" do
    section= Section.new(identifier: "new_section", label: "new section")
    section.save()

    assert_includes Section.all, section, "conflicted section should not be saved"
  end
end
