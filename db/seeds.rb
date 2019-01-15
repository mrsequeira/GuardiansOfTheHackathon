# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'faker'

participants = 100
mentors = 20
users = participants + mentors
tshirt = %w(XS S M L XS)
allergies = %w(gluten, peanut, milk, none)
difficulties = %w(none many)
vegan = [true, false]
courses = %w(LEI LEEC MEI)


Role.create(:name=>'admin')
Role.create(:name=>'normal')
roles = Role.all
u = User.create(:email => "admin@cityhack.ipt.pt", :password => "chumbados", :email_confirmed => true)
u.roles << Role.find_by(name: 'admin')
puts "Success: Roles and Admin data loaded"


Theme.create(:name_theme=>'Turismo',:description_theme=>'Descrição do tema turismo')
Theme.create(:name_theme=>'Ambiente',:description_theme=>'Descrição do tema Ambient')
Theme.create(:name_theme=>'Mobilidade',:description_theme=>'Descrição do tema mobolidade')
themes = Theme.all
puts "Success: Theme data loaded"

Team.create(:name=>'soviemoscomer', :project=>'GuiaTomar',:description=>'Uma aplicação móvel que serve como guia para um turista em Tomar',:photo=>'https://instagram.flis2-1.fna.fbcdn.net/vp/ab62b50f626550ca2fbd07c5d60cf47d/5CA0524E/t51.2885-15/e35/33090883_177708922943332_8539101596762505216_n.jpg?_nc_ht=instagram.flis2-1.fna.fbcdn.net') 
Team.create(:name=>'hackaros', :project=>'FunerariaNoPulso',:description=>'Uma pulseira que lê o batimento cardiaco do idoso, e quando este falecer, liga para a funerária',:photo=>'https://instagram.flis2-1.fna.fbcdn.net/vp/bf9c982e5e475c9eb137849bcd8e8963/5CAFD6B5/t51.2885-15/e35/33129318_628097007532649_1740681736045461504_n.jpg') 
Team.create(:name=>'Campeoes_do_t3clado', :project=>'TinderDeTomar',:description=>'Uma aplicação móvel equivalente ao tinder mas bloqueia os teus ex namorados',:photo=>'') 
Team.create(:name=>'gaymerstetris', :project=>'forumTomar',:description=>'Uma aplicação móvel/web que serve para relatar inconsistencias na via pública de Tomar',:photo=>'') 
teams = Team.all
puts "Success: Team data loaded"

mentors.times do
    u = User.create(:email=>Faker::Internet.unique.email, :password=>Faker::Internet.unique.password, :photo=>'', :email_confirmed => true)
    u.roles << roles.sample
    Mentor.create(:name_mentor=> Faker::Name.name ,:vegan=> vegan.sample, :tshirt_size=>tshirt.sample,:mentor_difficulties=> difficulties.sample ,:mentor_allergies=> allergies.sample ,:user => u ,:theme=> themes.sample)
end
puts "Success: Mentors created"

normal_role = Role.find_by(name: "normal")
participants.times do
    u = User.create(:email=>Faker::Internet.unique.email, :password=>Faker::Internet.unique.password, :photo=>'')
    u.roles << normal_role
    Participant.create(
        :name=> Faker::Name.name,
        :vegan=> vegan.sample,
        :tshirt_size=> tshirt.sample,
        :motor_difficulties=> difficulties.sample,
        :allergies=> allergies.sample,
        :leader=> false,
        :phone=>'916587945',
        :course=> courses.sample,
        :team=> teams.sample,
        :user=>u)
end

# set team themes and leaders
teams.each do |t|
    t.themes << themes.sample(rand(themes.count))
    tm = t.participants.sample
    tm.leader = true
    tm.save
end

