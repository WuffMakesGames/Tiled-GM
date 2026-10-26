/// @returns {Struct.TiledTileset,-1}
function tiled_load_tileset(_filename) {
	if (TILED_VERBOSE_LOGGING) show_debug_message("[Tiled] Loading Tileset {0}", _filename)
	if (!file_exists(_filename)) return -1
	
	// Get cached template
	var _instance = __Tiled()
	if (struct_exists(_instance.tilesets, _filename)) {
		return struct_get(_instance.tilesets, _filename)
	}
	
	// Load tileset
	var _data = __tiled_read_json(_filename)
	var _tileset = new TiledTileset(_data, _filename)
	struct_set(_instance.tilesets, _filename, _tileset)
	
	// Return tileset
	return _tileset
}