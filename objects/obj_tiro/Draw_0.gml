draw_self()

//Efeito de brilho no tiro

//Mudar a forma como a GPU processa as cores
gpu_set_blendmode(bm_add)

//Desenhando a sprite do tiro por cima do próprio tiro porém transparente
//sprite_index = sprite do obj
//image_index  = imagem do obj
//x e y	       = x e y  do obj
//_xscale e y  = escala x e y do obj
//image_angle  = angulo do obj
//image_blend  = cor do obj
//image_alpha  = transparencia do obj
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * 2, image_yscale * 2, image_angle, cor, image_alpha)

//Resetando o blendmode
gpu_set_blendmode(bm_normal)