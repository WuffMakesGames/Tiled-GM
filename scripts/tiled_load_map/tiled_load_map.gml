/// Loads a Tiled map and all it's sub-elements into a TiledMap
/// @arg {string} filename The path to the map file
/// @arg {string} absolute_path The actual path to load the map data from, only use this if you absolutely know what you are doing.
/// @return {Struct.TiledMap,-1}
function tiled_load_map(_filename, _absolute_path=_filename) {
	if (TILED_VERBOSE_LOGGING) show_debug_message("[Tiled] Loading map {0}", _filename)
	if (!file_exists(_filename)) return -1
	
	// Load map
	var _data = __tiled_read_json(_absolute_path)
	var _map = new TiledMap(_data, _filename)
	
	// Return map
	return _map
}