/// @description
//DESTRUINDO OS TIROS FORA DA ROOM
if (y <= -32){
	instance_destroy()
}

//Diminuindo o tiro
image_xscale = lerp(image_xscale, 1, .1)
image_yscale = lerp(image_yscale, 1, .1)

//Fazendo o tiro ganhar velocidade
vspeed = lerp(vspeed, -10, .1)