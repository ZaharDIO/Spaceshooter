/// @description 
//Parar de tocar todos os sons
audio_stop_all()
//Tocando a música do jogo
audio_play_sound(musica_fundo, 0, 1)
//VARIAVEIS
#region variáveis
	//Velocidade player
	vel = 2
	
	//Cooldown tiro
	timer_tiro = 0
	cooldown = 10
	
	//Lvl Tiro
	lvltiro = 1
	
	//Vidas
	vidas = 3
	
	//Escudos
	shield = 3
	
	//Timer Escudo
	timer_escudo	 = game_get_speed(gamespeed_fps) * 0.1
	timer_invencivel = 0
	
	//TENHO ESCUDO
	meu_escudo = noone
	
	//Variável para saber se o player levou dano
	inicia_shadercolor()
	
	//Variável para desenhar a escala
	inicia_squash_stretch()
	
#endregion

#region métodos
//SISTEMA DE MOVIMENTO
//Criando o metodo de controle
controla_player = function(){
//Pegando as teclas
	
	//Decrementando o timer da invencibilidade nessa função pois ela roda o tempo inteiro
	timer_invencivel--

	var _cima, _baixo, _esqu, _dire, _atirar
	
	//CIMA
	_cima   = keyboard_check(ord("W")) or keyboard_check(vk_up)

	//BAIXO
	_baixo  = keyboard_check(ord("S")) or keyboard_check(vk_down)
	
	//ESQUERDA
	_esqu   = keyboard_check(ord("A")) or keyboard_check(vk_left)
	
	//DIREITA
	_dire   = keyboard_check(ord("D")) or keyboard_check(vk_right)
	
	//ATIRAR
	_atirar = keyboard_check(vk_space) or mouse_check_button(mb_left)
	
//ATRIBUINDO A VELOCIDADE

	//Velocidade Horizontal
	var _velh = (_dire - _esqu)  * vel
	x += _velh
	
	//Velocidade Vertical
	var _velv = (_baixo - _cima) * vel
	y += _velv
	
//IMPEDINDO DE SAIR DA ROOM

	x = clamp(x, sprite_width/2,  room_width  - sprite_width/2)
	y = clamp(y, sprite_height/2, room_height - sprite_height/2)

//USANDO O ESCUDO
if keyboard_check_pressed(ord("E")){
	usashield()
}
	
//TIRO
	//Decrementando o timer
	timer_tiro--
	
	//SE eu apertei a tecla de atirar
	//E  timer do tiro está zerado
	if (_atirar && timer_tiro <= 0){
		//Som
		audio_stop_sound(sfx_laser1)
		efeito_som(sfx_laser1, .2)
		//Mudando o tamanho do player
		squash_stretch(.8, 1.2)
		//SE o nivel do tiro for 1, chame o tiro 1
		if (lvltiro == 1){
			//CHAMANDO O METODO TIRO
			tiro1()
		} else if (lvltiro == 2){
			//CHAMANDO O METODO TIRO
			tiro2()
		} else if (lvltiro == 3){
			//CHAMANDO O METODO TIRO
			tiro3()
		}
	
		//Resetando o timer de delay do tiro
		timer_tiro = cooldown
	
	}
}

tiro1 = function(){
		//Criar o tiro
		//Salvar o ID do tiro
		var _tiro = instance_create_layer(x,y,"Tiros", obj_tiro)
		
		//Fazer o tiro ir pra frente
		//_tiro.speed = 5
		_tiro.direction = 90
}

tiro2 = function(){
		//Criar o tiro
		//Salvar o ID do tiro
		var _tiro = instance_create_layer(x-10,y,"Tiros", obj_tiro)
		//Velocidade e direção do tiro
		//_tiro.speed = 5
		_tiro.direction = 90
		
		var _tiro2 = instance_create_layer(x+10,y,"Tiros", obj_tiro)
		//Velocidade e direção do tiro
		//_tiro2.speed = 5
		_tiro2.direction = 90
}

tiro3 = function(){
		//MISTURANDO O TIRO 1 COM O TIRO 2
		tiro1()
		tiro2()
}
	
ganhalevel = function(){
	if (lvltiro < 3)
	{
		lvltiro++
	}
}
	
//Passando um icone com parametros que podem ser alterados
drawico = function(_icone = spr_icovida, _qtd = 1, _y = 20){

	//Variável para setar o espaçamento entre os icones
	var _espaco = 0 

	//Repetindo a função de desenhar as vidas na tela de acordo
	//com a quantidade de vidas
	repeat(_qtd)
	{
		draw_sprite_ext(_icone, 0, 20 + _espaco, _y, 1, 1, 0, c_white, 0.5)
		//Adicionando valor de espaço a cada repetição
		_espaco += 30
	}
}	
	
perdevida = function(){
	//Se o timer de invencibilidade estiver valendo saia do evento de perder vidas
	if (timer_invencivel > 0) return;
	
	//Levei dano me achato
	squash_stretch(2, .5)
	
	//Levei dano aviso a variável que dano é verdadeiro
	shadercolor(5)
	
	//Enquanto vidas for maior que 0
	if (vidas > 0){
			vidas--
			//Invencibilidade após perder uma vida = 1 seg
			timer_invencivel = timer_escudo
			
			//Levei dano a tela treme
			screenshake(10)
	//Quando vidas for menor que 0
	} else {
		//Destrua todas as instância do player
		instance_destroy(obj_player)
		//Crio a particula de explosão
		instance_create_layer(x,y, "Particulas", obj_part_exp_player)
		//Morri a tela treme
		screenshake(50)
	}
}


usashield = function(){
	//SE escudo maior que 0 E SE ainda não tenho um escudo
	if (shield > 0 && meu_escudo == noone){
			//Atribuindo o objeto escudo a variável meu_escudo, para depois definir a posição dela
			meu_escudo = instance_create_layer(x,y, "Shield", obj_shield)
			shield--
			efeito_som(sfx_shieldUp, 0)
	}
}
	
escudoativo = function(){
	//SE eu tiver escudo, faço ele ficar na minha posição
	if (instance_exists(meu_escudo)) {
			meu_escudo.x = x
			meu_escudo.y = y
			timer_invencivel = timer_escudo
		} else {
			//SE o escudo ainda não existe, variável meu_escudo = noone
			meu_escudo = noone
	}
}
	

#endregion