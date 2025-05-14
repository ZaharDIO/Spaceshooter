#region globais
	//Variável para saber se o player morreu
	global.morte = false

	global.debug = false
	
	//Definindo o destino dos botões
	global.destino = rm_inicio
	
#endregion

#region métodos globais (funções)
 function destruir_instancia(_particula = obj_part_tiro)
 {
	instance_destroy()
	instance_create_layer(x,y,"Particulas",_particula)
 }
 
 //Função de screenshake
 function screenshake(_treme = 0)
 {
	//Checando se a instância do objeto screenshake existe
	if instance_exists(obj_screenshake){
		//Checar se o valor do screenshake é maior do que o do objeto
		//Acessar o objeto screenshake
		with(obj_screenshake){
			//Se o treme temporário for maior que o treme do objeto
			//Mude o valor, se não não faça nada
			if _treme > treme{
				treme = _treme
			}
		}
		//obj_screenshake.treme = _treme
	}
 
 }
 
 //Função para iniciar as variáveis do squash and stretch
 function inicia_squash_stretch()
 {
	//Iniciando as variáveis
	xscale = 1
	yscale = 1
 }
 
 //Função para o squash and stretch
 function squash_stretch(_xscale = 1, _yscale = 1)
 {
	xscale = _xscale
	yscale = _yscale
 }
 
 //Função para resetar o squash and stretch
 function reset_squash_stretch(_qtd = .1)
 {
	xscale = lerp(xscale, 1, _qtd)
	yscale = lerp(xscale, 1, _qtd)
 }
 
 //Função para desenhar o efeito squash and stretch
 function desenha_squash_stretch()
 {
	draw_sprite_ext(sprite_index,image_index,x,y,xscale,yscale,image_angle,image_blend,image_alpha)
 }
 
 //Função para iniciar variável do efeito de mudança de cor
 function inicia_shadercolor()
 {
	levei_dano = false
 }
 
 //Função para remover o efeito de mudança de cor
 function shadercolor(_tempo = 1)
 {
	levei_dano = _tempo
 }
 
 //Função para voltar a cor original
 function reset_shadercolor()
 {
	if (levei_dano > 0)
	{
		levei_dano--
	} 
 }
 
 //Função para usar o efeito de mudança de cor
 function desenha_shadercolor(_funcao_desenho = 0)
 {
	 if levei_dano
	 {
		shader_set(sh_branco) 
		_funcao_desenho()
		shader_reset()
	 } else {
		_funcao_desenho()
	 }
 }
 
 //Função de som
 function efeito_som(_som = sfx_laser1, _variacao = .1)
 {
	var _pitch = random_range(1 - _variacao, 1 + _variacao)
	audio_play_sound(_som, 0, 0, , ,_pitch)
 }
 
 //Função para mudar de room
 function change_room()
 {
	room_goto(global.destino)
 }
#endregion

