/// @description 

//Vida do inimigo
vida = 10

//Variável que controla o estado
estado = "Chegando"

//Variável do contador
contador = 0

//Variável de controle da direção do estado fugindo
decidi_direcao = false

//Timer
timer = game_get_speed(gamespeed_fps) * .5
timer_carregando = 0

//Máquina de estado
//State Machine
maquina_de_estado = function(){
	//Switch
	switch(estado){
		//Casos estado de chegando
		case "Chegando":{
			//Enquanto o Y dele for menor que 160 ele vai vir para baixo
			if (y < 160) {
				//Velocidade vertical = 1.2
				vspeed = 1.2
			} else {
				//Terminei de chegar eu mudo de estado
				estado = "Carregando"
			}
		}
		//Acabei o case, eu aviso que ele tem que parar
		break
		
		case "Carregando":{
			//Parando
			vspeed = 0
			
			//Esperar 3 segundos
			//Aumentar o timer até ele chegar no tempo
			timer_carregando++
			//Depois de 3 segundos ele vai para o estado de atirar
			if timer_carregando >= timer{
				//Trocando de estado
				estado = choose("Atirando","Atirando2")
				//Resetando o timer
				timer_carregando = 0
				//Aumentando o valor do contador
				contador++
			}
		}
		break
		
		case "Atirando":{
			repeat(3){
				//Fazer ele checar se o player existe
				if (instance_exists(obj_player)){
					//Encontrando a direção do player
					var _dir = point_direction(x, y, obj_player.x, obj_player.y)
				}
				
				//Variável do tiro
				var _tiro = instance_create_layer(x,y,"Tiros",obj_part_tiro1_inimigo3)
				
				//Velocidade do tiro
				_tiro.speed = 2
				
				//Direção do tiro
				_tiro.direction = _dir
				
				_tiro.image_angle = _dir + 90
				
			}
			//Após atirar voltar a carregar se o contador não for maior que 3
			if (contador < 3){
				estado = "Carregando"
			} else {
				estado = "Fugindo"
			}
		}	
		break
		
		case "Atirando2": {
			var _ang = 255;
			//Criando o tiro 2
			repeat(3){
				var _tiro2 = instance_create_layer(x,y,"Tiros",obj_part_tiro2_inimigo3)
			
				//Velocidade do tiro 2
				_tiro2.speed = 4
				
				//Direção do tiro 2
				_tiro2.direction = _ang
				
				//Aumentando o angulo do tiro
				_ang += 15
			}
			//Após atirar voltar a carregar se o contador não for maior que 3
			if (contador < 3){
				estado = "Carregando"
			} else {
				estado = "Fugindo"
			}
		}
		break
		
		case "Fugindo": {
			//Decidindo a direção de fuga se ela ainda não foi decidida
			if (decidi_direcao == false){
				//Escolhendo a direção
				hspeed = choose(-1, 1, 0);
				//Avisando que a direção foi escolhida
				decidi_direcao = true;
			}
				vspeed = -1
				//Se destruindo após fugir
		}
		break
	}
}

morrendo = function(){
	//Perder vida
	if (vida > 1){
		vida--
	} else {
		instance_destroy()
		instance_create_layer(x,y,"Particulas", obj_part_exp_inimigo)
	}
	//Se ele ficou sem vida ele se destroi
	
	//E cria a particula de explosão
}