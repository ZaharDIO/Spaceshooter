#region globais
	global.debug = false
#endregion

#region métodos globais
 function destruir_instancia(_particula = obj_part_tiro)
 {
	instance_destroy()
	instance_create_layer(x,y,"Particulas",_particula)
 }
#endregion