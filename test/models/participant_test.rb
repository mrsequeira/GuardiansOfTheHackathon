require 'test_helper'

class ParticipantTest < ActiveSupport::TestCase

  test "should save Participant with all columns" do

    p=Participant.new(name:"xuxa",vegan:false, tshirt_size:"XL", 
      motor_difficulties:"",allergies:"", leader:false, phone:"916488198",
      course:"LEI", user: users(:two), team: teams(:one)
    )
    assert p.save, "Can't be saved"
  end

  test "should not a save Participant" do

    p=Participant.new(name:"xuxa",vegan:false, tshirt_size:"XL", 
      motor_difficulties:"",allergies:"", leader:false, phone:"916488198",
      course:"LEI"
    )
    assert_not p.save, "Can't be saved"
  end

  test "should not a save Participant length name" do
    p=Participant.new(name:"xuxa", team_id:1)
    assert_not p.save, "Can't be saved"
  end

  test "should not a save Participant presence tshirt" do
    p=Participant.new(tshirt_size:"", team_id:1)
    assert_not p.save, "Can't be saved"
  end

  test "should not a save Participant length motor_difficulties" do
    p=Participant.new(motor_difficulties:"sadadadsadssadsadsadasdsasdasdsadsadasdasdsadsadsadasdsadasdsadasdasdasdsadsadasdasdasdsadsadsadasda", team_id:1)
    assert_not p.save, "Can't be saved"
  end

  test "should not a save Participant length allergies" do
    p=Participant.new(allergies:"sadadadsadssadsadsadasdsasdasdsadsadasdasdsadsadsadasdsadasdsadasdasdasdsadsadasdasdasdsadsadsadasda", team_id:1)
    assert_not p.save, "Can't be saved"
  end

  test "should not a save Participant phone with letters " do
    p=Participant.new(phone:"adssada", team_id:1)
    assert_not p.save, "Can't be saved"
  end

  test "should not a save Participant with course nill " do
    p=Participant.new(course:"", team_id:1)
    assert_not p.save, "Can't be saved"
  end

end
