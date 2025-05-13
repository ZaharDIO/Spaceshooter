/// @description 
//Destruindo objeto após colisão
instance_destroy()

//Ganha level ao colidir
//Nesse exemplo o other representa a instância que colidiu
other.ganhalevel()

//Criando a particula na colisão do player com o powerup
instance_create_layer(x,y, layer, obj_part_tiro)