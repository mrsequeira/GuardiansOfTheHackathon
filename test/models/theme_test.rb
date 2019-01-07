require 'test_helper'

class ThemeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save theme without name" do
      a=Themes.new(description_theme: "Description")
      assert_not a.save, "Saved without a name"
    end
    
    test "should not save theme without description" do
      a=Themes.new(name_theme: "Theme")
      assert_not a.save, "Saved without description"
    end
  
    test "should not save theme without name and description" do
      a=Themes.new
      assert_not a.save, "Saved without a name and description"
    end
  
    test "should save theme with name and description" do
      a=Themes.new(name_theme: "Theme", description_theme: "Description")
      assert a.save, "Saved with name and description"
    end
end
