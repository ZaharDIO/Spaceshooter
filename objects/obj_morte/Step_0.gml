//Ao morrer a variável morri se torna verdadeira
if global.morte
{
	//Se o timer for maior que 0
	if timer > 0 
		{
			timer-- 
		} 
		else 
			{
			//Se não for maior que 0 volte a room inicio e resete o timer e a variável de morte
			timer = 120
			global.morte = false
			global.destino = rm_inicio
			change_room()
		}	
}
