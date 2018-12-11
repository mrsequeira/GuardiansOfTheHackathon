# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Mentors.delete_all
Mentors.create(:id=>1,:name_mentor=>'José',:vegan=> true,:tshirt_size=>'L',:mentor_difficulties=>'nenhuma',:mentor_allergies=> 'Asma',:theme_id=>1,:user_id=>16)
Mentors.create(:id=>2,:name_mentor=>'Renato',:vegan=> true, :tshirt_size=>'M',:mentor_difficulties=>'nenhuma',:mentor_allergies=> '',:theme_id=>2,:user_id=>14)
Mentors.create(:id=>3,:name_mentor=>'Manuel Barros',:vegan=> true, :tshirt_size=>'M',:mentor_difficulties=>'nenhuma',:mentor_allergies=> '',:theme_id=>3,:user_id=>15)

puts "Success: Mentors data loaded"

Themes.delete_all
Themes.create(:id=>1,:name_theme=>'turismo',:description_theme=>'Descrição do tema turismo')
Themes.create(:id=>2,:name_theme=>'Ambiente',:description_theme=>'Descrição do tema Ambient')
Themes.create(:id=>3,:name_theme=>'Mobilidade',:description_theme=>'Descrição do tema mobolidade')
puts "Success: Themes data loaded"    

User.delete_all

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

Role.delete_all
Role.create(:id=>1, :name=>'admin')
Role.create(:id=>2, :name=>'normal')

puts "Success: Role data loaded"

UserRole.delete_all

UserRole.create(:user_id=>1,:role_id=>1)
UserRole.create(:user_id=>1,:role_id=>2)
UserRole.create(:user_id=>2,:role_id=>2)

puts "Success: User_Role data loaded"

Team.delete_all

Team.create(:id=>1, :name=>'soviemoscomer', :project=>'GuiaTomar',:description=>'Uma aplicação móvel que serve como guia para um turista em Tomar',:photo=>'https://instagram.flis2-1.fna.fbcdn.net/vp/ab62b50f626550ca2fbd07c5d60cf47d/5CA0524E/t51.2885-15/e35/33090883_177708922943332_8539101596762505216_n.jpg?_nc_ht=instagram.flis2-1.fna.fbcdn.net') 

Team.create(:id=>2, :name=>'hackaros', :project=>'FunerariaNoPulso',:description=>'Uma pulseira que lê o batimento cardiaco do idoso, e quando este falecer, liga para a funerária',:photo=>'https://instagram.flis2-1.fna.fbcdn.net/vp/bf9c982e5e475c9eb137849bcd8e8963/5CAFD6B5/t51.2885-15/e35/33129318_628097007532649_1740681736045461504_n.jpg') 

Team.create(:id=>3, :name=>'Campeoes_do_t3clado', :project=>'TinderDeTomar',:description=>'Uma aplicação móvel equivalente ao tinder mas bloqueia os teus ex namorados',:photo=>'') 

Team.create(:id=>4, :name=>'gaymerstetris', :project=>'forumTomar',:description=>'Uma aplicação móvel/web que serve para relatar inconsistencias na via pública de Tomar',:photo=>'') 

puts "Success: Team data loaded"

Participant.delete_all
#participants team 1
Participant.create(:id=>1,
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

Participant.create(:id=>2,
    :name=>'Manuel Escava', 
    :vegan=>false,
    :tshirt_size=>'S',
    :motor_difficulties=>'',
    :allergies=>'Pó',
    :leader=>false,
    :phone=>'916582945',
    :team_id=>1,
    :user_id=>2)

Participant.create(:id=>3,
    :name=>'Joaquim Matias', 
    :vegan=>false,
    :tshirt_size=>'M',
    :motor_difficulties=>'',
    :allergies=>'Pó',
    :leader=>false,
    :phone=>'91487945',
    :team_id=>1,
    :user_id=>3)

#participants team 2

Participant.create(:id=>4,
    :name=>'Joaquim Matias', 
    :vegan=>false,
    :tshirt_size=>'M',
    :motor_difficulties=>'Cadeira de Rodas',
    :allergies=>'',
    :leader=>true,
    :phone=>'913587945',
    :team_id=>2,
    :user_id=>4)

Participant.create(:id=>5,
    :name=>'Diogo Martins', 
    :vegan=>true,
    :tshirt_size=>'M',
    :motor_difficulties=>'',
    :allergies=>'',
    :leader=>false,
    :phone=>'912587945',
    :team_id=>2,
    :user_id=>5)

Participant.create(:id=>6,
    :name=>'Marco Mamelcio', 
    :vegan=>false,
    :tshirt_size=>'M',
    :motor_difficulties=>'',
    :allergies=>'',
    :leader=>true,
    :phone=>'911587945',
    :team_id=>2,
    :user_id=>6)
    
Participant.create(:id=>7,
    :name=>'Diogo Martins',
    :vegan=>true,
    :tshirt_size=>'M',
    :motor_difficulties=>'',
    :allergies=>'',
    :leader=>false,
    :phone=>'910587945',
    :team_id=>2,
    :user_id=>7)

#participants team 3

Participant.create(:id=>8,
    :name=>'Pedro Martins', 
    :vegan=>false,
    :tshirt_size=>'XL',
    :motor_difficulties=>'',
    :allergies=>'',
    :leader=>true,
    :phone=>'912587944',
    :team_id=>3,
    :user_id=>8)

Participant.create(:id=>9,
    :name=>'Marco Sushi', 
    :vegan=>false,
    :tshirt_size=>'L',
    :motor_difficulties=>'',
    :allergies=>'',
    :leader=>false,
    :phone=>'911587943',
    :team_id=>3,
    :user_id=>9)
    
Participant.create(:id=>10,
    :name=>'Diogo da China', 
    :vegan=>false,
    :tshirt_size=>'M',
    :motor_difficulties=>'Cadeira de Rodas',
    :allergies=>'Leite',
    :leader=>false,
    :phone=>'910587942',
    :team_id=>3,
    :user_id=>10)

#participants team 4

Participant.create(:id=>11,
    :name=>'Pedro Manso', 
    :vegan=>false,
    :tshirt_size=>'XL',
    :motor_difficulties=>'',
    :allergies=>'',
    :leader=>true,
    :phone=>'912587941',
    :team_id=>4,
    :user_id=>11)

Participant.create(:id=>12,
    :name=>'José Sushi', 
    :vegan=>false,
    :tshirt_size=>'L',
    :motor_difficulties=>'',
    :allergies=>'',
    :leader=>false,
    :phone=>'911587940',
    :team_id=>4,
    :user_id=>12)
    
Participant.create(:id=>13,
    :name=>'Bruno Manuel', 
    :vegan=>false,
    :tshirt_size=>'M',
    :motor_difficulties=>'Cadeira de Rodas',
    :allergies=>'Leite',
    :leader=>false,
    :phone=>'910587939',
    :team_id=>4,
    :user_id=>13)

    Team_themes.delete_all
    Team_themes.create(:id=>1,:teams_id=>1,:themes_id=>1)
    Team_themes.create(:id=>2,:teams_id=>1,:themes_id=>2)    
    Team_themes.create(:id=>3,:teams_id=>2,:themes_id=>3)
    Team_themes.create(:id=>4,:teams_id=>3,:themes_id=>1)       
puts "Sucess: Team_themes data loaded"
    
