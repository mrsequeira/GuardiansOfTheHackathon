# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# $paciencia = 1
# $preguica = 16
# # Em ruby tbm tens loops
# while $paciencia < $preguica  do
#     User.create(:id=> $i, :password=>'123', :email=>Faker::Internet.unique.email,:photo=>'')
#     $paciencia +=1
# end

Mentor.delete_all
Participant.delete_all
Theme.delete_all
Team.delete_all
User.delete_all
Role.delete_all
UserRole.delete_all
TeamTheme.delete_all

User.create(:id=>1, :password=>'123', :email=>'aluno19426@ipt.pt',:photo=>'')
User.create(:id=>2, :password=>'123', :email=>'aluno19428@ipt.pt',:photo=>'')
User.create(:id=>3, :password=>'123', :email=>'aluno19429@ipt.pt',:photo=>'')
User.create(:id=>4, :password=>'123', :email=>'aluno19430@ipt.pt',:photo=>'')
User.create(:id=>5, :password=>'123', :email=>'aluno19431@ipt.pt',:photo=>'')
User.create(:id=>6, :password=>'123', :email=>'aluno19432@ipt.pt',:photo=>'')
User.create(:id=>7, :password=>'123', :email=>'aluno19433@ipt.pt',:photo=>'')
User.create(:id=>8, :password=>'123', :email=>'aluno19434@ipt.pt',:photo=>'')
User.create(:id=>9, :password=>'123', :email=>'aluno19435@ipt.pt',:photo=>'')
User.create(:id=>10, :password=>'123', :email=>'aluno19436@ipt.pt',:photo=>'')
User.create(:id=>11, :password=>'123', :email=>'aluno19437@ipt.pt',:photo=>'')
User.create(:id=>12, :password=>'123', :email=>'aluno19438@ipt.pt',:photo=>'')
User.create(:id=>13, :password=>'123', :email=>'aluno19439@ipt.pt',:photo=>'')
User.create(:id=>14, :password=>'123', :email=>'renatopanda@ipt.pt',:photo=>'')
User.create(:id=>15, :password=>'123', :email=>'manuel.barros@ipt.pt',:photo=>'')
User.create(:id=>16, :password=>'123', :email=>'sushi.barros@ipt.pt',:photo=>'')
puts "Success: User data loaded"


Theme.create(:name_theme=>'turismo',:description_theme=>'Descrição do tema turismo')
    Theme.create(:name_theme=>'Ambiente',:description_theme=>'Descrição do tema Ambient')
    Theme.create(:name_theme=>'Mobilidade',:description_theme=>'Descrição do tema mobolidade')
    puts "Success: Theme data loaded"
    
Mentor.create(:id=>1,:name_mentor=>'José',:vegan=> true,:tshirt_size=>'L',:mentor_difficulties=>'nenhuma',:mentor_allergies=> 'Asma',:user_id=>16,:theme_id=>1)
Mentor.create(:id=>2,:name_mentor=>'Renato',:vegan=> true, :tshirt_size=>'M',:mentor_difficulties=>'nenhuma',:mentor_allergies=> '',:user_id=>14,:theme_id=>2)
Mentor.create(:id=>3,:name_mentor=>'Manuel Barros',:vegan=> true, :tshirt_size=>'M',:mentor_difficulties=>'nenhuma',:mentor_allergies=> '',:user_id=>15,:theme_id=>3)

puts "Success: Mentor data loaded"




# Plaka, Não precisavas de dar overkill! Nao estás em TI2 don't worry! looK: ref: https://github.com/stympy/faker#installing
# Exemplo:




Role.create(:id=>1, :name=>'admin')
Role.create(:id=>2, :name=>'normal')

puts "Success: Role data loaded"



UserRole.create(:user_id=>1,:role_id=>1)
UserRole.create(:user_id=>1,:role_id=>2)
UserRole.create(:user_id=>2,:role_id=>2)

puts "Success: User_Role data loaded"


Team.create(
    :id=>1, 
    :name=>'soviemoscomer', 
    :project=>'GuiaTomar',
    :description=>'Uma aplicação móvel que serve como guia para um turista em Tomar',
    :photo=>'https://instagram.flis2-1.fna.fbcdn.net/vp/ab62b50f626550ca2fbd07c5d60cf47d/5CA0524E/t51.2885-15/e35/33090883_177708922943332_8539101596762505216_n.jpg?_nc_ht=instagram.flis2-1.fna.fbcdn.net')

Team.create(
    :id=>2, 
    :name=>'hackaros', 
    :project=>'FunerariaNoPulso',
    :description=>'Uma pulseira que lê o batimento cardiaco do idoso, e quando este falecer, liga para a funerária',
    :photo=>'https://instagram.flis2-1.fna.fbcdn.net/vp/bf9c982e5e475c9eb137849bcd8e8963/5CAFD6B5/t51.2885-15/e35/33129318_628097007532649_1740681736045461504_n.jpg')

Team.create(:id=>3,
    :name=>'Campeoes_do_t3clado',
    :project=>'TinderDeTomar',
    :description=>'Uma aplicação móvel equivalente ao tinder mas bloqueia os teus ex namorados',
    :photo=>'')

Team.create(
    :id=>4, 
    :name=>'gaymerstetris', 
    :project=>'forumTomar',
    :description=>'Uma aplicação móvel/web que serve para relatar inconsistencias na via pública de Tomar',
    :photo=>'')

puts "Success: Team data loaded"


#participants team 1
Participant.create(
    :name=>'Diogo Martins',
    :vegan=>false,
    :tshirt_size=>'S',
    :motor_difficulties=>'',
    :allergies=>'',
    :leader=>true,
    :phone=>'916587945',
    :course=>'lei',
    :team_id=>1,
    :user_id=>1)

Participant.create(
    :name=>'Manuel Escava',
    :vegan=>false,
    :tshirt_size=>'S',
    :motor_difficulties=>'',
    :allergies=>'Pó',
    :leader=>false,
    :phone=>'916582945',
    :course=>'lei',
    :team_id=>1,
    :user_id=>2)

Participant.create(
    :name=>'Joaquim Matias',
    :vegan=>true,
    :tshirt_size=>'M',
    :motor_difficulties=>'',
    :allergies=>'Po',
    :leader=>false,
    :phone=>'914879451',
    :course=>'lei',
    :team_id=>1,
    :user_id=>3)

#participants team 2

Participant.create(
    :name=>'Joaquim Matias',
    :vegan=>false,
    :tshirt_size=>'M',
    :motor_difficulties=>'Cadeira de Rodas',
    :allergies=>'',
    :leader=>true,
    :phone=>'913587945',
    :course=>'lei',
    :team_id=>2,
    :user_id=>4)

Participant.create(
    :name=>'Diogo Martins',
    :vegan=>true,
    :tshirt_size=>'M',
    :motor_difficulties=>'',
    :allergies=>'',
    :leader=>false,
    :phone=>'912587945',
    :course=>'lei',
    :team_id=>2,
    :user_id=>5)

Participant.create(
    :name=>'Marco Mamelcio',
    :vegan=>false,
    :tshirt_size=>'M',
    :motor_difficulties=>'',
    :allergies=>'',
    :leader=>true,
    :phone=>'911587945',
    :course=>'lei',
    :team_id=>2,
    :user_id=>6)

Participant.create(
    :name=>'Diogo Martins',
    :vegan=>true,
    :tshirt_size=>'M',
    :motor_difficulties=>'',
    :allergies=>'',
    :leader=>false,
    :phone=>'910587945',
    :course=>'lei',
    :team_id=>2,
    :user_id=>7)

# #participants team 3

Participant.create(
    :name=>'Pedro Martins',
    :vegan=>false,
    :tshirt_size=>'XL',
    :motor_difficulties=>'',
    :allergies=>'',
    :leader=>true,
    :phone=>'912587944',
    :course=>'lei',
    :team_id=>3,
    :user_id=>8)

Participant.create(
    :name=>'Marco Sushi',
    :vegan=>false,
    :tshirt_size=>'L',
    :motor_difficulties=>'',
    :allergies=>'',
    :leader=>false,
    :phone=>'911587943',
    :course=>'lei',
    :team_id=>3,
    :user_id=>9)

Participant.create(
    :name=>'Diogo da China',
    :vegan=>false,
    :tshirt_size=>'M',
    :motor_difficulties=>'Cadeira de Rodas',
    :allergies=>'Leite',
    :leader=>false,
    :phone=>'910587942',
    :course=>'lei',
    :team_id=>3,
    :user_id=>10)

# #participants team 4

Participant.create(
    :name=>'Pedro Manso',
    :vegan=>false,
    :tshirt_size=>'XL',
    :motor_difficulties=>'',
    :allergies=>'',
    :leader=>true,
    :phone=>'912587941',
    :course=>'lei',
    :team_id=>4,
    :user_id=>11)

Participant.create(
    :name=>'José Sushi',
    :vegan=>false,
    :tshirt_size=>'L',
    :motor_difficulties=>'',
    :allergies=>'',
    :leader=>false,
    :phone=>'911587940',
    :course=>'lei',
    :team_id=>4,
    :user_id=>12)

Participant.create(
    :name=>'Bruno Manuel',
    :vegan=>false,
    :tshirt_size=>'M',
    :motor_difficulties=>'Cadeira de Rodas',
    :allergies=>'Leite',
    :leader=>false,   
    :phone=>'910587939',
    :course=>'lei',
    :team_id=>4,
    :user_id=>13)

puts "Success: Participant data loaded"


    TeamTheme.create(:team_id=>1,:theme_id=>1)
    TeamTheme.create(:team_id=>1,:theme_id=>2)
    TeamTheme.create(:team_id=>2,:theme_id=>3)
    TeamTheme.create(:team_id=>3,:theme_id=>1)
puts "Sucess: TeamTheme data loaded"
