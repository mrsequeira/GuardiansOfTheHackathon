require 'test_helper'

class MentorTest < ActiveSupport::TestCase

  test "should save Mentor with all columns" do
    a=Mentor.new(name_mentor:"José", tshirt_size:"M", mentor_difficulties:"", mentor_allergies:"", theme_id:1)
    assert a.save, "Can't be saved"
  end
  
  test "should save mentor without name and tshirt_size" do
    a=Mentor.new(name_mentor: "Theme", tshirt_size:"M")
    assert a.save, "Saved without  name and tshirt_size "
  end

  test "should not save mentor without tshirt_size" do
    a=Mentor.new(name_mentor: "José Preto")
    assert_not a.save, "Saved with name but without tshirt_size "
  end

  test "should not save mentor without name" do
    a=Mentor.new(tshirt_size: "José Preto")
    assert_not a.save, "Saved with tshirt_size  but without name "
  end

  test "should not save mentor without theme and tshirt_size" do
    a=Mentor.new(name_mentor: "", tshirt_size:"")
    assert_not a.save, "Saved without  name and tshirt_size "
  end
  
  test "should not save mentor without theme and tshirt_size blanks" do
    a=Mentor.new(name_mentor: "", tshirt_size:"")
    assert_not a.save, "Saved without  name and tshirt_size "
  end
  
  test "should save mentor just only with theme and tshirt_size" do
    a=Mentor.new(name_mentor: "José Preto", tshirt_size:"M")
    assert a.save, "Saved without  name and tshirt_size "
  end

  test "should not mentor with name length 3" do
    a=Mentor.new(name_mentor: "zé", tshirt_size:"M")
    assert_not a.save, "Saved without name length good."
  end

  test "should not mentor with mentor_difficulties length bigger then 50" do
    a=Mentor.new(mentor_difficulties: "dsadsadadasdsadasdasdsadsadsadsadsadadsasdsadsadsadasd")
    assert_not a.save, "Saved without name length good."
  end

end
