/// @description 
//Chamando o metodo de controle
controla_player()

//Chamando o metodo de escudo ativo
escudoativo()

if keyboard_check_released(vk_tab){
	global.debug = !global.debug
}

if keyboard_check_pressed(vk_up){
	lvltiro++
}

if keyboard_check_pressed(vk_down){
	lvltiro--
}