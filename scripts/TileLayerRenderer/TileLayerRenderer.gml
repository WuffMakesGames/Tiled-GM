/// @arg {Struct.TiledTileLayer} tilelayer
function TileLayerRenderer(_tilelayer) constructor {
	static u_outputSize		= shader_get_uniform(shd_tiled_draw_tilelayer, "u_outputSize")
	static u_textureCoords	= shader_get_uniform(shd_tiled_draw_tilelayer, "u_textureCoords")
	static u_columns		= shader_get_uniform(shd_tiled_draw_tilelayer, "u_columns")
	static u_texelSize		= shader_get_uniform(shd_tiled_draw_tilelayer, "u_texelSize")
	static u_cellSize		= shader_get_uniform(shd_tiled_draw_tilelayer, "u_cellSize")
	static u_texture		= shader_get_sampler_index(shd_tiled_draw_tilelayer, "u_texture")
	
	// Variables
	tilelayer = _tilelayer
	uvs = [0, 0, 0, 0, 0, 0]
	tex = -1
	texel_w = 1
	texel_h = 1
	
	buffer = -1
	surface = -1
	
	pixel_w = tilelayer.width * tilelayer.tileset.tilewidth
	pixel_h = tilelayer.height * tilelayer.tileset.tileheight
		
	//===============================================================
	#region Public methods
	
	static Destroy = function() {
		if (buffer_exists(buffer)) buffer_delete(buffer)
		if (surface_exists(surface)) surface_free(surface)
	}
	
	static SetTexture = function(_texture_id) {
		tex = _texture_id
		texel_w = texture_get_texel_width(_texture_id)
		texel_h = texture_get_texel_height(_texture_id)
	}
	
	static SetTextureUVs = function(_uvs) {
		uvs = _uvs
	}
	
	static Draw = function(_x, _y) {
		if (!buffer_exists(buffer)) buffer = __GetBuffer(tilelayer)
		if (!surface_exists(surface)) {
			surface = surface_create(tilelayer.width, tilelayer.height, surface_rgba8unorm)
			buffer_set_surface(buffer, surface, 0)
		}
		
		// Variables
		var _tileset = tilelayer.tileset
		var _tile_w = _tileset.tilewidth
		var _tile_h = _tileset.tileheight
	
		// Apply shader
		shader_set(shd_tiled_draw_tilelayer)
		shader_set_uniform_f(u_outputSize, pixel_w, pixel_h)
		shader_set_uniform_f(u_textureCoords, uvs[0], uvs[1])
		shader_set_uniform_f(u_columns, _tileset.columns)
		shader_set_uniform_f(u_texelSize, texel_w, texel_h)
		shader_set_uniform_f(u_cellSize, _tile_w, _tile_h)
		texture_set_stage(u_texture, tex)
		
		// Render tilemap
		draw_surface_ext(surface, _x, _y, _tile_w, _tile_h, 0, c_white, 1)
		
		// Reset shader
		shader_reset()
	}
	
	#endregion
	//===============================================================
	#region Private methods
	
	static __GetBuffer = function(_tilelayer) {
		var _buffer = buffer_create(_tilelayer.width * _tilelayer.height * 4, buffer_fixed, 4)
		buffer_seek(_buffer, buffer_seek_start, 0)
		for (var _i = 0; _i < _tilelayer.width * _tilelayer.height; _i++) {
			buffer_write(_buffer, buffer_u32, _tilelayer.data[_i] == -1 ? 0 : _tilelayer.data[_i])
		}
		return _buffer
	}
	
	#endregion
	//===============================================================
	
}