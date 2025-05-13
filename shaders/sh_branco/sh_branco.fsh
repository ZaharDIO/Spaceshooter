//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	//Desenhar a sprite toda branca
	//Pegando como a sprite está sendo desenhada
	vec4 cor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	cor.rgb = vec3(1.0, 1.0, 1.0);
	//Desenha a sprite normalmente
    gl_FragColor = cor;
}
