varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_outputSize;

uniform sampler2D u_texture;
uniform vec2 u_textureCoords;

uniform float u_columns;
uniform vec2 u_texelSize;
uniform vec2 u_cellSize;

void main()
{
	vec4 sample = texture2D(gm_BaseTexture, v_vTexcoord);
	float tiledata = floor(sample.r * 255.0) + floor(sample.g * 65535.0) + floor(sample.b * 16777215.0);
	float attribs = floor(sample.a * 255.0);
	float index = mod(tiledata, 16777216.0);
	
	// Parse attributes
	// TODO: Add rotation flag
	bool flip_x = attribs > 127.0;
	bool flip_y = mod(attribs, 128.0) > 63.0;
	
	// Sample texture
	vec2 pixel_coords = mod(v_vTexcoord * u_outputSize, u_cellSize);
	pixel_coords.x = flip_x ? u_cellSize.x - pixel_coords.x : pixel_coords.x;
	pixel_coords.y = flip_y ? u_cellSize.y - pixel_coords.y : pixel_coords.y;
	vec2 tile_coords = pixel_coords + vec2(mod(index, u_columns), floor(index / u_columns)) * u_cellSize;
	
	// Push final color
    vec4 sample_out = texture2D(u_texture, u_textureCoords + (tile_coords * u_texelSize));
	gl_FragColor = v_vColour * sample_out;
}
