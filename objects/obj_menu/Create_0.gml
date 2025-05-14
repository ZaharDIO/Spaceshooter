//Textos do menu
//Jogar
//Tutorial
//Sair

//Criar um array para as opções do menu
menu = ["Jogar","Tutorial","Sair"]

atual = 0

margem = 40

ativa_menu = function() 
{
	switch(atual)
	{
		//Jogar
		case 0:
			global.destino = rm_jogo
			change_room()
		break
		//Tutorial
		case 1:
			global.destino = rm_tutorial
			change_room()
		break
		//Sair
		case 2:
			game_end()
		break
	}
}

controla_menu = function()
{
	//Sempre que eu apertar a setinha para baixo eu desço no menu
	if (keyboard_check_pressed(ord("S")))
	{
		atual++
		efeito_som(sfx_zap, 0)
		margem = 0
	}
	
	//Sempre que eu apertar a setinha para cima eu subo no menu
	if (keyboard_check_pressed(ord("W")))
	{
		atual--
		efeito_som(sfx_zap, 0)
		margem = 0
	}
	
	//Clamp limita valores em um range especificado
	atual = clamp(atual, 0, array_length(menu)-1)
	
	//Lerp cria variações de um valor até outro
	margem = lerp(margem, 40, .1)
	
	
	//Fazendo o menu funcionar se a pessoa apertou o ENTER
	if (keyboard_check_pressed(vk_enter))
	{
		ativa_menu()
	}
	
}

desenha_menu = function()
{
	//Desenhando o texto no meio da tela
	var _meio_tela = display_get_gui_height() / 2

	//Alinhando o texto
	draw_set_valign(1)

	//Definindo a fonte
	draw_set_font(fnt_menu)

	//Pegando a altura da fonte
	var _alt = string_height("I")
	//Desenhando a opção de jogar
	//Usando laço de repetição para desenhar todas as opções
	//for usa um indicie, uma condição de repetição e uma ação
	for (var i = 0; i < array_length(menu); i++)
	{
		//Variavel da cor do texto
		var _cor = c_white
	
		//Variavel da margem
		var _marg = 0
	
		//Avisando que a opção atual fica na cor vermelha e tem margem
		//Checando se o I é igual a minha opção atual
		if (i == atual)
		{
			_cor = c_red
			_marg = margem
		}
		//Desenhando referente ao indicie
		draw_set_color(_cor)
		draw_text(20 + _marg,_meio_tela + i * _alt, menu[i])
		draw_set_color(-1)
	}


	//Resetando o drawset
	draw_set_valign(0)
	draw_set_font(-1)
}