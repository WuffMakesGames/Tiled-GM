/// @return {Struct.TiledTemplate,-1}
function tiled_load_template(_filename) {
	if (!file_exists(_filename)) return -1
	if (TILED_VERBOSE_LOGGING) show_debug_message("[Tiled] Loading template {0}", _filename)
	
	// Get cached template
	var _instance = __Tiled()
	if (struct_exists(_instance.templates, _filename)) {
		return struct_get(_instance.templates, _filename)
	}
	
	// Load template
	var _data = __tiled_read_json(_filename)
	var _template = new TiledTemplate(_data, _filename)
	struct_set(_instance.templates, _filename, _template)
	
	// Return template
	return _template
}