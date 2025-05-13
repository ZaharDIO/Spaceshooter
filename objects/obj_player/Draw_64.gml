/// @description 

//Apenas se TAB for pressionado
//Desenhando o debug de level do tiro
if (global.debug == true){
	draw_text(20,20,"Level tiro: " + string(lvltiro))
}
//DESENHANDO VIDAS
drawico(spr_icovida, vidas, 20)

//DESENHANDO ESCUDOS
drawico(spr_icoshield, shield, 60)