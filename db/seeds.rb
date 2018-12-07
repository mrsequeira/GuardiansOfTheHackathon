# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Team.delete_all

Team.create(:id=>1, :name=>'soviemoscomer', :project=>'GuiaTomar',:description=>'Uma aplicação móvel que serve como guia para um turista em Tomar',:edition => DateTime.strptime("09/01/2009 17:00", "%m/%d/%Y %H:%M")) 

Team.create(:id=>2, :name=>'hackaros', :project=>'FunerariaNoPulso',:description=>'Uma pulseira que lê o batimento cardiaco do idoso, e quando este falecer, liga para a funerária',:edition => DateTime.strptime("09/01/2009 17:00", "%m/%d/%Y %H:%M")) 

Team.create(:id=>3, :name=>'Campeoes_do_t3clado', :project=>'TinderDeTomar',:description=>'Uma aplicação móvel equivalente ao tinder mas bloqueia os teus ex namorados',:edition => DateTime.strptime("09/01/2009 17:00", "%m/%d/%Y %H:%M")) 

Team.create(:id=>4, :name=>'gaymerstetris', :project=>'forumTomar',:description=>'Uma aplicação móvel/web que serve para relatar inconsistencias na via pública de Tomar',:edition => DateTime.strptime("09/01/2009 17:00", "%m/%d/%Y %H:%M")) 

puts "Success: Team data loaded"


Participant.delete_all

#participants team 1
Participant.create(:id=>1,
    :name=>'João Miguel', 
    :email=>'aluno19400@ipt.pt',
    :password=>'123',
    :vegan=>false,
    :tshirt_size=>'S',
    :motor_difficulties=>'',
    :allergies=>'',
    :caption=>true,
    :phone=>'916587945',
    :team_id=>1)

Participant.create(:id=>2,
    :name=>'Manuel Escava', 
    :email=>'aluno19401@ipt.pt',
    :password=>'123',
    :vegan=>false,
    :tshirt_size=>'S',
    :motor_difficulties=>'',
    :allergies=>'Pó',
    :caption=>false,
    :phone=>'916582945',
    :team_id=>1)

Participant.create(:id=>3,
    :name=>'Joaquim Matias', 
    :email=>'aluno19402@ipt.pt',
    :password=>'123',
    :vegan=>false,
    :tshirt_size=>'M',
    :motor_difficulties=>'',
    :allergies=>'Pó',
    :caption=>false,
    :phone=>'91487945',
    :team_id=>1)

puts "Sucess: Participant data loaded"

#participants team 2

Participant.create(:id=>4,
    :name=>'Joaquim Matias', 
    :email=>'aluno19404@ipt.pt',
    :password=>'123',
    :vegan=>false,
    :tshirt_size=>'M',
    :motor_difficulties=>'Cadeira de Rodas',
    :allergies=>'',
    :caption=>true,
    :phone=>'913587945',
    :team_id=>2)

Participant.create(:id=>5,
    :name=>'Diogo Martins', 
    :email=>'aluno19405@ipt.pt',
    :password=>'123',
    :vegan=>true,
    :tshirt_size=>'M',
    :motor_difficulties=>'',
    :allergies=>'',
    :caption=>false,
    :phone=>'912587945',
    :team_id=>2)

Participant.create(:id=>6,
    :name=>'Marco Mamelcio', 
    :email=>'aluno19406@ipt.pt',
    :password=>'123',
    :vegan=>false,
    :tshirt_size=>'M',
    :motor_difficulties=>'',
    :allergies=>'',
    :caption=>true,
    :phone=>'911587945',
    :team_id=>2)
    
Participant.create(:id=>7,
    :name=>'Diogo Martins', 
    :email=>'aluno19407@ipt.pt',
    :password=>'123',
    :vegan=>true,
    :tshirt_size=>'M',
    :motor_difficulties=>'',
    :allergies=>'',
    :caption=>false,
    :phone=>'910587945',
    :team_id=>2)

#participants team 3

Participant.create(:id=>8,
    :name=>'Pedro Martins', 
    :email=>'aluno19408@ipt.pt',
    :password=>'123',
    :vegan=>false,
    :tshirt_size=>'XL',
    :motor_difficulties=>'',
    :allergies=>'',
    :caption=>true,
    :phone=>'912587944',
    :team_id=>3)

Participant.create(:id=>9,
    :name=>'Marco Sushi', 
    :email=>'aluno19409@ipt.pt',
    :password=>'123',
    :vegan=>false,
    :tshirt_size=>'L',
    :motor_difficulties=>'',
    :allergies=>'',
    :caption=>false,
    :phone=>'911587943',
    :team_id=>3)
    
Participant.create(:id=>10,
    :name=>'Diogo da China', 
    :email=>'aluno19410@ipt.pt',
    :password=>'123',
    :vegan=>false,
    :tshirt_size=>'M',
    :motor_difficulties=>'Cadeira de Rodas',
    :allergies=>'Leite',
    :caption=>false,
    :phone=>'910587942',
    :team_id=>3)

#participants team 4

Participant.create(:id=>11,
    :name=>'Pedro Manso', 
    :email=>'aluno194011@ipt.pt',
    :password=>'123',
    :vegan=>false,
    :tshirt_size=>'XL',
    :motor_difficulties=>'',
    :allergies=>'',
    :caption=>true,
    :phone=>'912587941',
    :team_id=>4)

Participant.create(:id=>12,
    :name=>'José Sushi', 
    :email=>'aluno194012@ipt.pt',
    :password=>'123',
    :vegan=>false,
    :tshirt_size=>'L',
    :motor_difficulties=>'',
    :allergies=>'',
    :caption=>false,
    :phone=>'911587940',
    :team_id=>4)
    
Participant.create(:id=>13,
    :name=>'Bruno Manuel', 
    :email=>'aluno19413@ipt.pt',
    :password=>'123',
    :vegan=>false,
    :tshirt_size=>'M',
    :motor_difficulties=>'Cadeira de Rodas',
    :allergies=>'Leite',
    :caption=>false,
    :phone=>'910587939',
    :team_id=>4)

    
    
    

# Theme.create(:id => 1, :name=>'Lite', :background_color=>'0xC7FFD5', :title_text_color=>'0x222222',
#     :component_theme_color=>'0x001277', :carrier_select_color=>'0x7683FF', :label_text_color=>'0x000000',
#     :join_upper_gradient=>'0x6FAEFF', :join_lower_gradient=>'0x000000', :join_text_color=>'0xFFFFFF',
#     :cancel_link_color=>'0x001277', :border_color=>'0x888888', :carrier_text_color=>'0x000000', :public => true)