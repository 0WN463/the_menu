require "test_helper"

class SectionTest < ActiveSupport::TestCase
  test "disallow duplicate identifier" do
    section= Section.new(identifier: "first_section", label:"new section")
    section.save()

    assert_not_includes Section.all, section, "conflicted section should not be saved"
  end
end
