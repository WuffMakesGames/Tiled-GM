/// Loads a Tiled world into a TiledWorld
/// @arg {string} filename The path to the world file
/// @return {Struct.TiledWorld,-1}
function tiled_load_world(_filename) {
	if (TILED_VERBOSE_LOGGING) show_debug_message("[Tiled] Loading world {0}", _filename)
	if (!file_exists(_filename)) return -1
	
	// Load map
	var _data = __tiled_read_json(_filename)
	var _map = new TiledWorld(_data, _filename)
	
	// Return map
	return _map
}