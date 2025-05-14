//Tremendo a tela 
if treme > 0.1 {
	
	//Tremendo a horizontal
	var _x = random_range(-treme, treme)
	//Tremendo a vertical
	var _y = random_range(-treme, treme)
	//Alterar X do viewport
	view_set_xport(view_current, _x)
	//Alterar Y do viewport
	view_set_yport(view_current, _y)
	
} else { 
	
	//Zerando o valor do tremor após ele chegar perto de 0 
	treme = 0
	//Garantindo que a viewport vai voltar a posição inicial
	view_set_xport(view_current,0)
	view_set_yport(view_current,0)
}

//Parando o tremor aos poucos
treme = lerp(treme, 0, .1)