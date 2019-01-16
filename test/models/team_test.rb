require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save team without name" do
    a=Team.new()
    assert_not a.save, "Saved without a name"
  end
  
  test "should save team with name" do
    a=Team.new(name: "Nome_Equipa")
    assert a.save, "Saved with team name"
  end

  test "should save team with name, project and description" do
    a=Team.new(name:"Nome_Equipa", project:"Project", description:"description project")
    assert a.save, "Saved with a name, project and description"
  end

  test "should save team with name, project, description and photo" do
    a=Team.new(name:"Nome_Equipa", project:"Project", description:"description project", photo:"photo.jpg")
    assert a.save, "Saved with a name, project and description"
  end

 
end
