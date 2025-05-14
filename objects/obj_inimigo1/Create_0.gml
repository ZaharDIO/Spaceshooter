/// @description
//Randomizando as seeds do Gamemaker
randomize()

//Descobrindo se o inimigo foi criado em uma sequence
criado_em_sequence = in_sequence

//Setando o alarme para 2 segundos
alarm[0] = game_get_speed(gamespeed_fps) * 2

//Metodo de atirar
atirando = function() {
	efeito_som(sfx_laser2, .1)
	//Só posso atirar se eu estou dentro da room
	if (x < room_width && x > 0 && y > 0 && y < room_height)
	{
		var _tiro = instance_create_layer(x,y, "Tiros", obj_tiro_inimigo1)
		_tiro.vspeed = 4
	}
}

morrendo = function()
{
	destruir_instancia(obj_part_exp_inimigo)
	
	//Setando um valor aleatório de 0 a 100
	var _chance = random(100)
	//Tocando som
	efeito_som(sfx_explosion, .1)
	//Criando o power up
	//SE a chance for maior que 90
	if (_chance >= 95){
		instance_create_layer(x,y,layer,obj_powerup)
	}
}