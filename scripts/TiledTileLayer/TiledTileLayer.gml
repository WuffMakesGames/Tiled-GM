/// @arg {Struct} layer_data
/// @arg {Struct.TiledTilesetRef} tileset_ref
function TiledTileLayer(layer_data, tileset_ref, _depth) : TiledLayer(layer_data, _depth) constructor {
	is_empty = true
	
	width = __tiled_struct_get_default(layer_data, "width", 0)
	height = __tiled_struct_get_default(layer_data, "height", 0)
	
	tileset = tileset_ref.source
	data = []
	
	// Tileset variables
	var _firstgid = tileset_ref.firstgid
	var _lastgid = _firstgid + tileset_ref.source.tilecount
	
	// Parse data, exclude out-of-range tiles
	var _rawdata = __tiled_struct_get_default(layer_data, "data", [])
	for (var i = 0; i < array_length(_rawdata); i++) {
		var _tiledata = _rawdata[i]
		var _tile = tiled_tile_get_index(_tiledata)
		
		if (_tile >= _firstgid && _tile < _lastgid) {
			is_empty = false
			data[i] = (_tile - _firstgid) | (_tiledata - _tile)
		} else {
			data[i] = -1
		}
	}
	
	//===============================================================
	#region Methods
	
	/// @arg {Real} cell_x
	/// @arg {Real} cell_y
	/// @return {Real}
	static Get = function(_cell_x, _cell_y) {
		return point_in_rectangle(_cell_x, _cell_y, 0, 0, width-1, height-1) ? data[floor(_cell_x) + width * floor(_cell_y)] : 0
	}
	
	/// @arg {Real} x
	/// @arg {Real} y
	/// @return {Real}
	static GetAtPixel = function(_x, _y) {
		return Get(_x div tileset.tilewidth, _y div tileset.tileheight)
	}
	
	/// @return {Real}
	static GetWidth = function() {
		return width
	}
	
	/// @return {Real}
	static GetHeight = function() {
		return height
	}
	
	/// @return {Real}
	static GetTileWidth = function() {
		return tileset.tilewidth
	}
	
	/// @return {Real}
	static GetTileHeight = function() {
		return tileset.tileheight
	}
	
	/// @return {Struct.TiledTileset}
	static GetTileset = function() {
		return tileset
	}
	
	/// @arg {Real} tiledata
	/// @arg {Real} cell_y
	/// @arg {Real} cell_x
	static Set = function(_tiledata, _cell_x, _cell_y) {
		if (point_in_rectangle(_cell_x, _cell_y, 0, 0, width-1, height-1)) {
			data[floor(_cell_x) + width * floor(_cell_y)] = _tiledata
		}
	}
	
	/// @arg {Real} tiledata
	/// @arg {Real} x
	/// @arg {Real} y
	/// @return {Real}
	static SetAtPixel = function(_tiledata, _x, _y) {
		return Set(_tiledata, _x div tileset.tilewidth, _y div tileset.tileheight)
	}
	
	#endregion
	//===============================================================
}