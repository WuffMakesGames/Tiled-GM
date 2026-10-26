function TiledTileset(_struct, _filename) constructor {
	path = _filename
	
	// Type error
	var _type = __tiled_struct_get_default(_struct, "type", -1)
	if (_type != "tileset") show_debug_message("[Tiled] Error loading tileset, wrong type: {0} - {1}", _filename, _type)
	
	// Load variables
	name		= __tiled_struct_get_default(_struct, "name", "")
		
	image		= __tiled_struct_get_default(_struct, "image", "")
	imageheight = __tiled_struct_get_default(_struct, "imageheight", 0)
	imagewidth	= __tiled_struct_get_default(_struct, "imagewidth", 0)
		
	margin		= __tiled_struct_get_default(_struct, "margin", 0)
	spacing		= __tiled_struct_get_default(_struct, "spacing", 0)
	columns		= __tiled_struct_get_default(_struct, "columns", 0)
		
	tilewidth	= __tiled_struct_get_default(_struct, "tilewidth", 32)
	tileheight	= __tiled_struct_get_default(_struct, "tileheight", 32)
	tilecount	= __tiled_struct_get_default(_struct, "tilecount", 0)
	
	tiles = []
	
	// Get path to image
	image = __tiled_parse_path(image, _filename)
	
	// Debugging
	if (TILED_VERBOSE_LOGGING) show_debug_message("[Tiled] Parsing tiles")
	
	// Parse tiles
	var _tiles = __tiled_struct_get_default(_struct, "tiles", [])
	for (var i = 0; i < array_length(_tiles); i++) {
		var _tile = new TiledTile(_tiles[i])
		tiles[_tile.id] = _tile
	}
	
}