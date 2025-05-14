tutorial = ["MOVER","ATIRAR","ESCUDO","SAIR"]
desenha_menu = function()
{
	//Desenhando o texto no meio da tela
	var _meio_tela = 210

	//Alinhando o texto
	draw_set_valign(1)

	//Definindo a fonte
	draw_set_font(fnt_menu)

	//Pegando a altura da fonte
	var _alt = string_height("I")
	//Desenhando a opção de jogar
	//Usando laço de repetição para desenhar todas as opções
	//for usa um indicie, uma condição de repetição e uma ação
	for (var i = 0; i < array_length(tutorial); i++)
	{
		//Variavel da cor do texto
		var _cor = c_white
	
		//Variavel da margem
		var _marg = 350
		
		//Desenhando referente ao indicie
		draw_set_color(_cor)
		draw_text(20 + _marg,_meio_tela + i * _alt * 2.1, tutorial[i])
		draw_set_color(-1)
	}
	//Resetando o drawset
	draw_set_valign(0)
	draw_set_font(-1)
}
