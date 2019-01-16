require 'test_helper'

class TeamThemeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save without team and theme" do
    a=TeamTheme.new()
    assert_not a.save, "Saved without team and theme"
  end

end
